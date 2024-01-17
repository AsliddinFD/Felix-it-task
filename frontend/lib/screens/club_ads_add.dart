import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/utils/styles.dart';

class ClubAdsAdd extends StatelessWidget {
  const ClubAdsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.xmark),
            ),
            const SizedBox(width: 10),
            const Text('New ads'),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Title'),
                    TextFormField(
                      decoration: customInputStyle(
                        context,
                        'Enter a product title',
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text('Description'),
                    TextFormField(
                      maxLines: 10,
                      decoration: customInputStyle(
                          context, 'Enter a product description'),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 126,
                          height: 1,
                          color: const Color(0xFF01001F),
                        ),
                        const SizedBox(width: 10),
                        const Text('Change location'),
                        const SizedBox(width: 10),
                        Container(
                          width: 126,
                          height: 1,
                          color: const Color(0xFF01001F),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    const Text('Address by location'),
                    TextFormField(
                      decoration:
                          customInputStyle(context, 'Enter the map address'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset('assets/map.png'),
            )
          ],
        ),
      ),
    );
  }
}
