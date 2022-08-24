class VideoResponse {
  String? createdAt;
  String? image;
  String? videoUrl;
  String? id;

  VideoResponse({this.createdAt, this.image, this.videoUrl, this.id});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    image = json['image'];
    videoUrl = json['videoUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['image'] = this.image;
    data['videoUrl'] = this.videoUrl;
    data['id'] = this.id;
    return data;
  }
}
