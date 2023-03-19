// To parse this JSON data, do
//
//     final catWiseProductModel = catWiseProductModelFromJson(jsonString);

import 'dart:convert';

List<CatWiseProductModel> catWiseProductModelFromJson(String str) => List<CatWiseProductModel>.from(json.decode(str).map((x) => CatWiseProductModel.fromJson(x)));

class CatWiseProductModel {
  CatWiseProductModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    this.stockQuantity,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    this.lowStockAmount,
     this.soldIndividually,
     this.weight,
     this.dimensions,
     this.shippingRequired,
     this.shippingTaxable,
     this.shippingClass,
     this.shippingClassId,
     this.reviewsAllowed,
     this.averageRating,
     this.ratingCount,
     this.upsellIds,
     this.crossSellIds,
     this.parentId,
     this.purchaseNote,
     this.categories,
     this.tags,
     this.images,
     this.attributes,
     this.defaultAttributes,
     this.variations,
     this.groupedProducts,
     this.menuOrder,
     this.priceHtml,
     this.relatedIds,
    this.metaData,
     this.stockStatus,
     this.hasOptions,
     this.links,
  });

  int? id;
  String? name;
  String? slug;
  String? permalink;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  Type? type;
  Status? status;
  bool? featured;
  CatalogVisibility? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  TaxStatus? taxStatus;
  TaxClass? taxClass;
  bool? manageStock;
  dynamic? stockQuantity;
  Backorders? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic? lowStockAmount;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Category>? categories;
  List<Category>? tags;
  List<Image>? images;
  List<Attribute>? attributes;
  List<dynamic>? defaultAttributes;
  List<int>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaDatum>? metaData;
  StockStatus? stockStatus;
  bool? hasOptions;
  Links? links;

  factory CatWiseProductModel.fromJson(Map<String, dynamic> json) => CatWiseProductModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    permalink: json["permalink"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    type: typeValues.map[json["type"]],
    status: statusValues.map[json["status"]],
    featured: json["featured"],
    catalogVisibility: catalogVisibilityValues.map[json["catalog_visibility"]],
    description: json["description"],
    shortDescription: json["short_description"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
    dateOnSaleTo: json["date_on_sale_to"],
    dateOnSaleToGmt: json["date_on_sale_to_gmt"],
    onSale: json["on_sale"],
    purchasable: json["purchasable"],
    totalSales: json["total_sales"],
    virtual: json["virtual"],
    downloadable: json["downloadable"],
    downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
    downloadLimit: json["download_limit"],
    downloadExpiry: json["download_expiry"],
    externalUrl: json["external_url"],
    buttonText: json["button_text"],
    taxStatus: taxStatusValues.map[json["tax_status"]],
    taxClass: taxClassValues.map[json["tax_class"]],
    manageStock: json["manage_stock"],
    stockQuantity: json["stock_quantity"],
    backorders: backordersValues.map[json["backorders"]],
    backordersAllowed: json["backorders_allowed"],
    backordered: json["backordered"],
    lowStockAmount: json["low_stock_amount"],
    soldIndividually: json["sold_individually"],
    weight: json["weight"],
    dimensions: Dimensions.fromJson(json["dimensions"]),
    shippingRequired: json["shipping_required"],
    shippingTaxable: json["shipping_taxable"],
    shippingClass: json["shipping_class"],
    shippingClassId: json["shipping_class_id"],
    reviewsAllowed: json["reviews_allowed"],
    averageRating: json["average_rating"],
    ratingCount: json["rating_count"],
    upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
    crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
    parentId: json["parent_id"],
    purchaseNote: json["purchase_note"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
    variations: List<int>.from(json["variations"].map((x) => x)),
    groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
    menuOrder: json["menu_order"],
    priceHtml: json["price_html"],
    relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
    metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
    stockStatus: stockStatusValues.map[json["stock_status"]],
    hasOptions: json["has_options"],
    links: Links.fromJson(json["_links"]),
  );


}

class Attribute {
  Attribute({
    required this.id,
    required this.name,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  int id;
  String name;
  int position;
  bool visible;
  bool variation;
  List<String> options;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"],
    name: json["name"],
    position: json["position"],
    visible: json["visible"],
    variation: json["variation"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "position": position,
    "visible": visible,
    "variation": variation,
    "options": List<dynamic>.from(options.map((x) => x)),
  };
}

enum Backorders { NO }

final backordersValues = EnumValues({
  "no": Backorders.NO
});

enum CatalogVisibility { VISIBLE }

final catalogVisibilityValues = EnumValues({
  "visible": CatalogVisibility.VISIBLE
});

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  int id;
  String name;
  String slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

}

class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  String length;
  String width;
  String height;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"],
    width: json["width"],
    height: json["height"],
  );

}

class Image {
  Image({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String src;
  String name;
  String alt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
  );


}

class Links {
  Links({
    required this.self,
    required this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

}

class Collection {
  Collection({
    required this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class MetaDatum {
  MetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  int id;
  String key;
  dynamic value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
    id: json["id"],
    key: json["key"],
    value: json["value"],
  );

}

class PurpleValue {
  PurpleValue({
    required this.name,
    required this.titleFormat,
    required this.descriptionEnable,
    required this.description,
    required this.type,
    required this.display,
    required this.position,
    required this.required,
    required this.restrictions,
    required this.restrictionsType,
    required this.adjustPrice,
    required this.priceType,
    required this.price,
    required this.min,
    required this.max,
    required this.options,
  });

  String name;
  String titleFormat;
  int descriptionEnable;
  String description;
  String type;
  String display;
  int position;
  int required;
  int restrictions;
  String restrictionsType;
  int adjustPrice;
  PriceType priceType;
  String price;
  int min;
  int max;
  List<Option> options;

  factory PurpleValue.fromJson(Map<String, dynamic> json) => PurpleValue(
    name: json["name"],
    titleFormat: json["title_format"],
    descriptionEnable: json["description_enable"],
    description: json["description"],
    type: json["type"],
    display: json["display"],
    position: json["position"],
    required: json["required"],
    restrictions: json["restrictions"],
    restrictionsType: json["restrictions_type"],
    adjustPrice: json["adjust_price"],
    priceType: priceTypeValues.map[json["price_type"]]!,
    price: json["price"],
    min: json["min"],
    max: json["max"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );

}

class Option {
  Option({
    required this.label,
    required this.price,
    required this.image,
    required this.priceType,
  });

  String label;
  String price;
  String image;
  PriceType priceType;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    label: json["label"],
    price: json["price"],
    image: json["image"],
    priceType: priceTypeValues.map[json["price_type"]]!,
  );

}

enum PriceType { FLAT_FEE }

final priceTypeValues = EnumValues({
  "flat_fee": PriceType.FLAT_FEE
});

class FluffyValue {
  FluffyValue({
    this.the8141,
    this.wordCount,
    this.linkCount,
    this.headingCount,
    this.mediaCount,
    this.the10744,
  });

  The10744? the8141;
  String? wordCount;
  String? linkCount;
  String? headingCount;
  String? mediaCount;
  The10744? the10744;

  factory FluffyValue.fromJson(Map<String, dynamic> json) => FluffyValue(
    the8141: json["8141"] == null ? null : The10744.fromJson(json["8141"]),
    wordCount: json["wordCount"],
    linkCount: json["linkCount"],
    headingCount: json["headingCount"],
    mediaCount: json["mediaCount"],
    the10744: json["10744"] == null ? null : The10744.fromJson(json["10744"]),
  );

}

class The10744 {
  The10744({
    required this.videoType,
    required this.uploadVideoId,
    required this.uploadVideoUrl,
    required this.youtubeUrl,
    required this.vimeoUrl,
    required this.autoplay,
    required this.videoSize,
    required this.videoControl,
    required this.hideGalleryImg,
    required this.hideInformation,
    required this.audioStatus,
  });

  String videoType;
  String uploadVideoId;
  String uploadVideoUrl;
  String youtubeUrl;
  String vimeoUrl;
  String autoplay;
  String videoSize;
  String videoControl;
  String hideGalleryImg;
  String hideInformation;
  String audioStatus;

  factory The10744.fromJson(Map<String, dynamic> json) => The10744(
    videoType: json["video_type"],
    uploadVideoId: json["upload_video_id"],
    uploadVideoUrl: json["upload_video_url"],
    youtubeUrl: json["youtube_url"],
    vimeoUrl: json["vimeo_url"],
    autoplay: json["autoplay"],
    videoSize: json["video_size"],
    videoControl: json["video_control"],
    hideGalleryImg: json["hide_gallery_img"],
    hideInformation: json["hide_information"],
    audioStatus: json["audio_status"],
  );

}

enum Status { PUBLISH }

final statusValues = EnumValues({
  "publish": Status.PUBLISH
});

enum StockStatus { INSTOCK, OUTOFSTOCK }

final stockStatusValues = EnumValues({
  "instock": StockStatus.INSTOCK,
  "outofstock": StockStatus.OUTOFSTOCK
});

enum TaxClass { EMPTY, ZERO_RATE }

final taxClassValues = EnumValues({
  "": TaxClass.EMPTY,
  "zero-rate": TaxClass.ZERO_RATE
});

enum TaxStatus { TAXABLE, NONE }

final taxStatusValues = EnumValues({
  "none": TaxStatus.NONE,
  "taxable": TaxStatus.TAXABLE
});

enum Type { SIMPLE, VARIABLE }

final typeValues = EnumValues({
  "simple": Type.SIMPLE,
  "variable": Type.VARIABLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
