import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
} //a

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        title: Text("Home page", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black45,
            ),
            onPressed: () {
              // Aquí puedes poner la funcionalidad si decides agregar una página nueva
            },
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Tarjeta estilo banco
              Container(
                height: 210,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.indigo, Colors.blueAccent],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "VISA",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Icon(Icons.wifi, color: Colors.white, size: 28),
                      ],
                    ),
                    Text(
                      "**** **** **** 1234",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Card Holder",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12)),
                            Text("JUAN PÉREZ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Expiry",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12)),
                            Text("12/26",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Last Transactions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              SizedBox(height: 15),
              // Aquí están las transacciones de ejemplo.
              TransactionView(
                transaction: TransactionModel(
                    name: 'Shopping', price: 1000, type: '-', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Salary', price: 1000, type: '+', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Receive', price: 200, type: '+', currency: 'US'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Modelo para las transacciones
class TransactionModel {
  final String name;
  final double price;
  final String type;
  final String currency;

  TransactionModel({
    required this.name,
    required this.price,
    required this.type,
    required this.currency,
  });
}

// Vista para mostrar cada transacción
class TransactionView extends StatelessWidget {
  final TransactionModel transaction;

  TransactionView({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            transaction.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${transaction.type}${transaction.price} ${transaction.currency}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: transaction.type == '+' ? Colors.green : Colors.red),
          ),
        ],
      ),
    );
  }
}
