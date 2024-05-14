import 'package:flutter/material.dart';

class HistoryDetail extends StatelessWidget {
  const HistoryDetail({super.key});
  static const route = "order_steppper";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'History Detail',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.orange,
                fontSize: 27,
                fontWeight: FontWeight.bold),
          ),
          actions: [],
        ),
        body: Row(
          children: [
            const Expanded(child: SizedBox()),
            Container(
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Steps(
                            isFaild: false,
                            isSuccesful: false,
                            isProcessing: true,
                            text: "request accepted",
                            icon: Icons.mail),
                        ProcessBar(
                          isSucessful: true,
                          isFaild: false,
                        ),
                        Steps(
                            isFaild: false,
                            isSuccesful: true,
                            isProcessing: false,
                            text: "Delivery Accepted",
                            icon: Icons.delivery_dining),
                        ProcessBar(
                          isSucessful: true,
                          isFaild: false,
                        ),
                        Steps(
                            isFaild: true,
                            isSuccesful: false,
                            isProcessing: false,
                            text: "Item Is Moving",
                            icon: Icons.directions_walk),
                        ProcessBar(
                          isSucessful: false,
                          isFaild: false,
                        ),
                        Steps(
                            isFaild: false,
                            isSuccesful: false,
                            isProcessing: false,
                            text: "Arrived And Accepted",
                            icon: Icons.share_arrival_time),
                        ProcessBar(
                          isSucessful: false,
                          isFaild: false,
                        ),
                        Steps(
                            isFaild: false,
                            isSuccesful: false,
                            isProcessing: false,
                            text: "Arrived And Accepted",
                            icon: Icons.share_arrival_time),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(flex: 2, child: SizedBox()),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                        // onPressed: () =>
                        //     Navigator.pushNamed(context, OrderDetail.route),
                        onPressed: () {},
                        child: const Text("Detiled Information")),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ));
  }
}

class ProcessBar extends StatelessWidget {
  const ProcessBar({
    Key? key,
    required this.isSucessful,
    required this.isFaild,
  }) : super(key: key);
  final bool isSucessful;
  final bool isFaild;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isFaild && !isSucessful || isFaild && isSucessful)
          Container(
            padding: const EdgeInsets.only(left: 17),
            height: 25,
            child: const VerticalDivider(
              color: Color.fromARGB(30, 0, 0, 0),
            ),
          ),
        if (isSucessful && !isFaild)
          Container(
            padding: const EdgeInsets.only(left: 17),
            height: 25,
            child: const VerticalDivider(
              color: Colors.green,
            ),
          ),
        if (isFaild && !isSucessful)
          Container(
            padding: const EdgeInsets.only(left: 17),
            height: 25,
            child: const VerticalDivider(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}

class Steps extends StatelessWidget {
  const Steps({
    Key? key,
    required this.text,
    required this.isProcessing,
    required this.isSuccesful,
    required this.isFaild,
    required this.icon,
  }) : super(key: key);
  final String text;
  final bool isProcessing;
  final bool isSuccesful;
  final bool isFaild;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(30, 0, 0, 0),
              radius: 25,
              child: Icon(
                icon,
                color: Colors.orange,
              ),
            ),
            if (isProcessing)
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange, width: 2)),
              ),
            if (isSuccesful)
              const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 25,
                child: Icon(
                  Icons.done_outlined,
                  color: Colors.white,
                ),
              ),
            if (isFaild)
              const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 25,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text)
      ],
    );
  }
}
