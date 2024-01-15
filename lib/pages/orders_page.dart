import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : (snapshot.error != null)
                  ? const Center(child: Text('Ocorreu um erro'))
                  : Consumer<OrderList>(
                      builder: (context, orders, child) => ListView.builder(
                        itemCount: orders.itemsCount,
                        itemBuilder: (context, index) =>
                            OrderWidget(order: orders.items[index]),
                      ),
                    );
        },
      ),
    );
  }

  // body: _isLoading
  //     ? const Center(child: CircularProgressIndicator())
  //     : ListView.builder(
  //         itemCount: orders.itemsCount,
  //         itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
  //       ),
}
