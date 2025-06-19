import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:e_commerce/user_model.dart';

class UserProvider with ChangeNotifier {
  User _user = User.empty();
  late Box<User> _userBox;
  late Box<List> _usersBox; // Changed to Box<List> since we store List<User>
  bool _isInitialized = false;
  bool _isLoading = false;
  String? _error;

  User get user => _user;
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await init();
    }
  }

  Future<void> init() async {
    if (_isInitialized || _isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _userBox = await Hive.openBox<User>('currentUser');
      _usersBox = await Hive.openBox<List>('usersBox');

      // Load users data
      final List<dynamic>? usersData = _usersBox.get('users');
      List<User> users = [];

      if (usersData != null) {
        users = usersData.cast<User>().toList();
      }

      if (users.isEmpty) {
        await _usersBox.put('users', <User>[]);
      }

      _user = _userBox.get('currentUser') ?? User.empty();
      _isInitialized = true;
    } catch (e) {
      _error = 'Initialization Error: ${e.toString()}';
      debugPrint('Error details: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> registerUser(User newUser) async {
    await _ensureInitialized();
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final List<dynamic>? usersData = _usersBox.get('users');
      List<User> users = usersData?.cast<User>().toList() ?? <User>[];

      if (users.any((u) => u.username == newUser.username)) {
        throw Exception('Username already exists');
      }
      if (users.any((u) => u.email == newUser.email)) {
        throw Exception('Email already registered');
      }

      users.add(newUser);
      await _usersBox.put('users', users);
      await _setCurrentUser(newUser);
    } catch (e) {
      _error = 'Registration Failed: ${e.toString()}';
      debugPrint('Registration error details: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginUser(String usernameOrEmail, String password) async {
    await _ensureInitialized();
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final List<dynamic>? usersData = _usersBox.get('users');
      List<User> users = usersData?.cast<User>().toList() ?? <User>[];

      User? matchedUser;
      for (final user in users) {
        if ((user.username == usernameOrEmail || user.email == usernameOrEmail) &&
            user.password == password) {
          matchedUser = user;
          break;
        }
      }

      if (matchedUser == null || matchedUser.userId.isEmpty) {
        throw Exception('Invalid username/email or password');
      }

      await _setCurrentUser(matchedUser);
    } catch (e) {
      _error = 'Login Failed: ${e.toString()}';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _setCurrentUser(User user) async {
    _user = user;
    await _userBox.put('currentUser', user);
    notifyListeners();
  }

  Future<void> logout() async {
    await _ensureInitialized();
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      await _userBox.delete('currentUser');
      _user = User.empty();
    } catch (e) {
      _error = 'Logout Failed: ${e.toString()}';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteUser(String userId) async {
    await _ensureInitialized();
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final List<dynamic>? usersData = _usersBox.get('users');
      List<User> users = usersData?.cast<User>().toList() ?? <User>[];
          
      users.removeWhere((u) => u.userId == userId);
      await _usersBox.put('users', users);

      if (_user.userId == userId) {
        await _userBox.delete('currentUser');
        _user = User.empty();
      }
    } catch (e) {
      _error = 'Account Deletion Failed: ${e.toString()}';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUser(User updatedUser) async {
    await _ensureInitialized();
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final List<dynamic>? usersData = _usersBox.get('users');
      List<User> users = usersData?.cast<User>().toList() ?? <User>[];
      
      final index = users.indexWhere((u) => u.userId == updatedUser.userId);
      
      if (index != -1) {
        users[index] = updatedUser;
        await _usersBox.put('users', users);
      }
      
      if (_user.userId == updatedUser.userId) {
        await _setCurrentUser(updatedUser);
      }
    } catch (e) {
      _error = 'Update Failed: ${e.toString()}';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _userBox.close();
    _usersBox.close();
    super.dispose();
  }
}