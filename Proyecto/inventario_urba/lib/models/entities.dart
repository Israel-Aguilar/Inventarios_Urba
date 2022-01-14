// To parse this JSON data, do
//
//     final entidad = entidadFromMap(jsonString);

import 'dart:convert';

class Entidad {
    Entidad({
        required this.valorCampoEntidadPkId,
        this.avance,
        required this.details,
    });

    int valorCampoEntidadPkId;
    dynamic avance;
    List<Detail> details;

    factory Entidad.fromJson(String str) => Entidad.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Entidad.fromMap(Map<String, dynamic> json) => Entidad(
        valorCampoEntidadPkId: json["valorCampoEntidadPKId"],
        avance: json["avance"],
        details: List<Detail>.from(json["details"].map((x) => Detail.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "valorCampoEntidadPKId": valorCampoEntidadPkId,
        "avance": avance,
        "details": List<dynamic>.from(details.map((x) => x.toMap())),
    };
}

class ValorCampoEntidadFk {
    ValorCampoEntidadFk({
        required this.id,
        required this.valor,
        required this.descripcion,
    });

    int id;
    Detail valor;
    Detail descripcion;

    factory ValorCampoEntidadFk.fromJson(String str) => ValorCampoEntidadFk.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ValorCampoEntidadFk.fromMap(Map<String, dynamic> json) => ValorCampoEntidadFk(
        id: json["id"],
        valor: Detail.fromMap(json["valor"]),
        descripcion: Detail.fromMap(json["descripcion"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "valor": valor.toMap(),
        "descripcion": descripcion.toMap(),
    };
}

class Detail {
    Detail({
        required this.id,
        this.fecha,
        required this.texto,
        this.numero,
        this.latitud,
        this.longitud,
        this.documento,
        this.nombreDocumento,
        required this.campoEntidadId,
        required this.entidadId,
        this.valorCampoEntidadFkId,
        this.valorCampoEntidadFk,
        required this.valorCampoEntidadPkId,
    });

    int id;
    DateTime? fecha;
    String texto;
    int? numero;
    dynamic latitud;
    dynamic longitud;
    dynamic documento;
    dynamic nombreDocumento;
    int campoEntidadId;
    int entidadId;
    int? valorCampoEntidadFkId;
    ValorCampoEntidadFk? valorCampoEntidadFk;
    int valorCampoEntidadPkId;

    factory Detail.fromJson(String str) => Detail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Detail.fromMap(Map<String, dynamic> json) => Detail(
        id: json["id"],
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        texto: json["texto"] == null ? null : json["texto"],
        numero: json["numero"] == null ? null : json["numero"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        documento: json["documento"],
        nombreDocumento: json["nombreDocumento"],
        campoEntidadId: json["campoEntidadId"],
        entidadId: json["entidadId"],
        valorCampoEntidadFkId: json["valorCampoEntidadFKId"] == null ? null : json["valorCampoEntidadFKId"],
        valorCampoEntidadFk: json["valorCampoEntidadFK"] == null ? null : ValorCampoEntidadFk.fromMap(json["valorCampoEntidadFK"]),
        valorCampoEntidadPkId: json["valorCampoEntidadPKId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fecha": fecha == null ? null : fecha?.toIso8601String(),
        "texto": texto == null ? null : texto,
        "numero": numero == null ? null : numero,
        "latitud": latitud,
        "longitud": longitud,
        "documento": documento,
        "nombreDocumento": nombreDocumento,
        "campoEntidadId": campoEntidadId,
        "entidadId": entidadId,
        "valorCampoEntidadFKId": valorCampoEntidadFkId == null ? null : valorCampoEntidadFkId,
        "valorCampoEntidadFK": valorCampoEntidadFk == null ? null : valorCampoEntidadFk?.toMap(),
        "valorCampoEntidadPKId": valorCampoEntidadPkId,
    };
}
