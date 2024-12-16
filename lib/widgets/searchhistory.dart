import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  final List<String> history;
  final Function(String) onSelect;
  final Function(String) onRemove;

  const SearchHistory({
    required this.history,
    required this.onSelect,
    required this.onRemove,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return history.isEmpty
        ? Center(
      child: Text(
        "Tidak ada riwayat pencarian.",
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    )
        : ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, index) {
        final query = history[index];
        return ListTile(
          title: Text(
            query,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          trailing: IconButton(
            icon: Icon(Icons.close, color: Colors.grey),
            onPressed: () => onRemove(query),
          ),
          onTap: () => onSelect(query),
        );
      },
    );
  }
}