class ImageResponse {
  String? createdAt;
  String? image;
  String? id;

  ImageResponse({this.createdAt, this.image, this.id});

  ImageResponse.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
