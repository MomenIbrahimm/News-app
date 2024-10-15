import 'package:flutter/material.dart';

import '../../share/components/components.dart';

class ArticleLoadingItem extends StatelessWidget {
  const ArticleLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) => Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  '',
                  maxLines: 1,
                )),
                Spacer(),
                Text(''),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey.withOpacity(0.3),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(''),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                SizedBox(
                    width: 80,
                    height: 30.0,
                    child: MaterialButton(
                      elevation: 5.0,
                      color: Colors.blueGrey,
                      onPressed: () {},
                      child: const Text(
                        "",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
      separatorBuilder: (context, index) => myDivider(),
    );
  }
}
