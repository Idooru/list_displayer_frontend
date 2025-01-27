class CardResponse {
  final int id;
  final String title;
  final String writer;
  final String status;

  const CardResponse({
    required this.id,
    required this.title,
    required this.writer,
    required this.status,
  });

  factory CardResponse.fromJson(Map<String, dynamic> json) {
    return CardResponse(
      id: json["id"],
      title: json["title"],
      writer: json["writer"],
      status: json["status"],
    );
  }
}
