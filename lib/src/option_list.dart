part of flutter_mentions;

class OptionList extends StatelessWidget {
  OptionList({
    required this.data,
    required this.onTap,
    required this.suggestionListHeight,
    this.suggestionBuilder,
    this.suggestionListDecoration,
    this.suggestionListHeader,
  });

  final Widget Function(Map<String, dynamic>)? suggestionBuilder;

  final List<Map<String, dynamic>> data;

  final Function(Map<String, dynamic>) onTap;

  final double suggestionListHeight;

  final BoxDecoration? suggestionListDecoration;

  /// Optional header widget displayed above the suggestion list.
  final Widget? suggestionListHeader;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? Container(
            clipBehavior: Clip.hardEdge,
            decoration:
                suggestionListDecoration ?? BoxDecoration(color: Colors.white),
            constraints: BoxConstraints(
              maxHeight: suggestionListHeight,
              minHeight: 0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (suggestionListHeader != null) suggestionListHeader!,
                Flexible(
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          onTap(data[index]);
                        },
                        child: suggestionBuilder != null
                            ? suggestionBuilder!(data[index])
                            : Container(
                                color: Colors.blue,
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  data[index]['display'],
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
