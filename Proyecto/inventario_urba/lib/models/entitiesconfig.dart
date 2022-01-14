// To parse this JSON data, do
//
//     final entidadConfig = entidadConfigFromMap(jsonString);

import 'dart:convert';

class EntidadConfig {
    EntidadConfig({
        required this.isSuccess,
        this.message,
        required this.result,
    });

    bool isSuccess;
    dynamic message;
    Result result;

    factory EntidadConfig.fromJson(String str) => EntidadConfig.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EntidadConfig.fromMap(Map<String, dynamic> json) => EntidadConfig(
        isSuccess: json["isSuccess"],
        message: json["message"],
        result: Result.fromMap(json["result"]),
    );

    Map<String, dynamic> toMap() => {
        "isSuccess": isSuccess,
        "message": message,
        "result": result.toMap(),
    };
}

class CamposEntidad {
    CamposEntidad({
        required this.id,
        this.dependeCatalogo,
        required this.nombre,
        required this.descripcion,
        required this.orden,
        required this.tipoDato,
        this.tipoFormato,
        this.formato,
        required this.requerido,
        required this.visible,
        required this.salida,
        required this.visibleListado,
        required this.ordenable,
        required this.entidadId,
        this.entidad,
        this.entidadCatalogoId,
        this.entidadCatalogo,
        this.grupoId,
        this.grupo,
        required this.campoValor,
        required this.campoDescripcion,
        this.valorCampoEntidad,
    });

    int id;
    bool? dependeCatalogo;
    String nombre;
    String descripcion;
    int orden;
    int tipoDato;
    int? tipoFormato;
    dynamic formato;
    bool requerido;
    bool visible;
    bool salida;
    bool visibleListado;
    bool ordenable;
    int entidadId;
    dynamic entidad;
    int? entidadCatalogoId;
    Result? entidadCatalogo;
    int? grupoId;
    Grupo? grupo;
    bool campoValor;
    bool campoDescripcion;
    dynamic valorCampoEntidad;

    factory CamposEntidad.fromJson(String str) => CamposEntidad.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CamposEntidad.fromMap(Map<String, dynamic> json) => CamposEntidad(
        id: json["id"],
        dependeCatalogo: json["dependeCatalogo"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        orden: json["orden"],
        tipoDato: json["tipoDato"],
        tipoFormato: json["tipoFormato"] == null ? null : json["tipoFormato"],
        formato: json["formato"],
        requerido: json["requerido"],
        visible: json["visible"],
        salida: json["salida"],
        visibleListado: json["visibleListado"],
        ordenable: json["ordenable"],
        entidadId: json["entidadId"],
        entidad: json["entidad"],
        entidadCatalogoId: json["entidadCatalogoId"] == null ? null : json["entidadCatalogoId"],
        entidadCatalogo: json["entidadCatalogo"] == null ? null : Result.fromMap(json["entidadCatalogo"]),
        grupoId: json["grupoId"],
        grupo: Grupo.fromMap(json["grupo"]),
        campoValor: json["campoValor"],
        campoDescripcion: json["campoDescripcion"],
        valorCampoEntidad: json["valorCampoEntidad"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "dependeCatalogo": dependeCatalogo,
        "nombre": nombre,
        "descripcion": descripcion,
        "orden": orden,
        "tipoDato": tipoDato,
        "tipoFormato": tipoFormato == null ? null : tipoFormato,
        "formato": formato,
        "requerido": requerido,
        "visible": visible,
        "salida": salida,
        "visibleListado": visibleListado,
        "ordenable": ordenable,
        "entidadId": entidadId,
        "entidad": entidad,
        "entidadCatalogoId": entidadCatalogoId == null ? null : entidadCatalogoId,
        "entidadCatalogo": entidadCatalogo == null ? null : entidadCatalogo?.toMap(),
        "grupoId": grupoId,
        "grupo": grupo?.toMap(),
        "campoValor": campoValor,
        "campoDescripcion": campoDescripcion,
        "valorCampoEntidad": valorCampoEntidad,
    };
}

class Result {
    Result({
        required this.id,
        this.catalogo,
        required this.idCampoValor,
        required this.idCampoDescripcion,
        required this.nombre,
        required this.descripcion,
        required this.orden,
        required this.icono,
        required this.grupoId,
        this.grupo,
        this.camposEntidad,
    });

    int id;
    bool? catalogo;
    int idCampoValor;
    int idCampoDescripcion;
    String nombre;
    String descripcion;
    int orden;
    String icono;
    int grupoId;
    Grupo? grupo;
    List<CamposEntidad>? camposEntidad;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        catalogo: json["catalogo"],
        idCampoValor: json["idCampoValor"] == null ? null : json["idCampoValor"],
        idCampoDescripcion: json["idCampoDescripcion"] == null ? null : json["idCampoDescripcion"],
        nombre: json["nombre"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
        orden: json["orden"],
        icono: json["icono"] == null ? null : json["icono"],
        grupoId: json["grupoId"],
        grupo: json["grupo"] == null ? null : Grupo.fromMap(json["grupo"]),
        camposEntidad: json["camposEntidad"] == null ? null : List<CamposEntidad>.from(json["camposEntidad"].map((x) => CamposEntidad.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "catalogo": catalogo,
        "idCampoValor": idCampoValor == null ? null : idCampoValor,
        "idCampoDescripcion": idCampoDescripcion == null ? null : idCampoDescripcion,
        "nombre": nombre,
        "descripcion": descripcion == null ? null : descripcion,
        "orden": orden,
        "icono": icono == null ? null : icono,
        "grupoId": grupoId,
        "grupo": grupo == null ? null : grupo?.toMap(),
        "camposEntidad": camposEntidad == null ? null : List<dynamic>.from(camposEntidad!.map((x) => x.toMap())),
    };
}

class Grupo {
    Grupo({
        required this.id,
        required this.nombre,
        required this.descripcion,
        required this.orden,
        required this.icono,
        required this.tipo,
        this.entidades,
        this.eventos,
    });

    int id;
    Nombre? nombre;
    Descripcion? descripcion;
    int orden;
    Icono? icono;
    int tipo;
    dynamic entidades;
    dynamic eventos;

    factory Grupo.fromJson(String str) => Grupo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Grupo.fromMap(Map<String, dynamic> json) => Grupo(
        id: json["id"],
        nombre: nombreValues.map[json["nombre"]],
        descripcion: descripcionValues.map[json["descripcion"]],
        orden: json["orden"],
        icono: iconoValues.map[json["icono"]],
        tipo: json["tipo"],
        entidades: json["entidades"],
        eventos: json["eventos"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombreValues.reverse[nombre],
        "descripcion": descripcionValues.reverse[descripcion],
        "orden": orden,
        "icono": iconoValues.reverse[icono],
        "tipo": tipo,
        "entidades": entidades,
        "eventos": eventos,
    };
}

enum Descripcion { DATOS_DE_LOS_INVENTARIOS, LAS_SUCURSALES }

final descripcionValues = EnumValues({
    "DATOS DE LOS INVENTARIOS": Descripcion.DATOS_DE_LOS_INVENTARIOS,
    "LAS SUCURSALES": Descripcion.LAS_SUCURSALES
});

enum Icono { EARTH, HOME }

final iconoValues = EnumValues({
    "earth": Icono.EARTH,
    "home": Icono.HOME
});

enum Nombre { DATOS, SUCURSALES }

final nombreValues = EnumValues({
    "DATOS": Nombre.DATOS,
    "SUCURSALES": Nombre.SUCURSALES
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap=new Map<T,String>();

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
