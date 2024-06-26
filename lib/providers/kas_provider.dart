part of 'providers.dart';

class KasProvider extends ChangeNotifier{
  List<SaldoKas> _saldoKas = [];
  List<SaldoKas> get saldoKas => _saldoKas;

  final KasService _kasService = KasService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createKas (SaldoKas newKas) async{
    _isLoading = true;
    notifyListeners();
    try{
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _kasService.createKas(newKas, storedToken!);
      await getAllKas();
    }catch(e){
      print('Error create saldo kas: $e');
      throw Exception('Failed to create saldo kas $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllKas () async {
    _isLoading = true;
    notifyListeners();

    try{
      final data = await _kasService.getAllKas();
      _saldoKas = data;
    }catch(e){
      print('Error get all saldo kas: $e');
      throw Exception('Failed to get all saldo kas $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateKas (int idKas, SaldoKas updatedKas) async {
    _isLoading = true;
    notifyListeners();

    try{
      final storedToken = await _secureStorage.read(key: 'token');
      await _kasService.updateKas(idKas, updatedKas, storedToken!);
      await getAllKas();
    }catch(e){
      print('Error update saldo kas: $e');
      throw Exception('Failed to update saldo kas $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteKas (int idKas) async {
    _isLoading = true;
    notifyListeners();

    try{
      final storedToken = await _secureStorage.read(key: 'token');
      final data = await _kasService.deleteKas(idKas, storedToken!);
    }catch(e){
      print('Error delete saldo kas: $e');
      throw Exception('Failed to delete saldo kas $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  
}



