prior it looks like => import 'package:packages/packages.dart';
import 'package:preferences/preferences.dart' show FlavorConfig;

import '../cache/cache.dart';

class  ApiClient {
  late final Dio _dio = Dio();
  // const ApiClient(this.config, this.cacheManager, this.dio);
  final FlavorConfig? config;
  // final CacheStorage?  cacheManager;

  ApiClient(this.config, 
  // {this.cacheManager}
  ){
    _dio.options = BaseOptions(
        baseUrl: config?.baseUrl ?? FlavorConfig().baseUrl, // the place for your base url
        // receiveTimeout: Duration(seconds: 30),
        // connectTimeout: Duration(seconds: 30),
        // sendTimeout: Duration(seconds: 30),
        );
}
// .. complete it wit dio and its inspector
Dio get apiClient => _dio;
} => and I want to create a separate file => class ApiServices {


>
```json
{
    "namespace": "ldlms/v1",
    "routes": {
        "/ldlms/v1": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "namespace": {
                            "default": "ldlms/v1",
                            "required": false
                        },
                        "context": {
                            "default": "view",
                            "required": false
                        }
                    }
                }
            ],
            "_links": {
                "self": [
                    {
                        "href": "https://www.dofit.me/wp-json/ldlms/v1"
                    }
                ]
            }
        },
        "/ldlms/v1/echo": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": []
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": []
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": []
                }
            ],
            "_links": {
                "self": [
                    {
                        "href": "https://www.dofit.me/wp-json/ldlms/v1/echo"
                    }
                ]
            }
        },
        "/ldlms/v1/sfwd-courses": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        },
                        "after": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate dopo una data fornita nello standard ISO8601. ",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_after": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati dopo una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "author": {
                            "description": "Limita la serie di risultati agli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "author_exclude": {
                            "description": "Garantisce che la serie di risultati escluda gli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "before": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate prima di una data fornita nello standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_before": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati prima di una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "menu_order": {
                            "description": "Limita la serie di risultati agli articoli con uno specifico valore menu_order.",
                            "type": "integer",
                            "required": false
                        },
                        "search_semantics": {
                            "description": "Come interpretare l'input di ricerca.",
                            "type": "string",
                            "enum": [
                                "exact"
                            ],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title",
                                "menu_order"
                            ],
                            "required": false
                        },
                        "search_columns": {
                            "default": [],
                            "description": "Array di nomi di colonna da cercare.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "post_title",
                                    "post_content",
                                    "post_excerpt"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "slug": {
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più slug specifici.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        },
                        "status": {
                            "default": "publish",
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più stati assegnati.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "publish",
                                    "future",
                                    "draft",
                                    "pending",
                                    "private",
                                    "trash",
                                    "auto-draft",
                                    "inherit",
                                    "request-pending",
                                    "request-confirmed",
                                    "request-failed",
                                    "request-completed",
                                    "ywgc-disabled",
                                    "ywgc-dismissed",
                                    "ywgc-code-not-valid",
                                    "ywgc-pre-printed",
                                    "wc-active",
                                    "wc-switched",
                                    "wc-expired",
                                    "wc-pending-cancel",
                                    "wc-pending",
                                    "wc-processing",
                                    "wc-on-hold",
                                    "wc-completed",
                                    "wc-cancelled",
                                    "wc-refunded",
                                    "wc-failed",
                                    "wc-checkout-draft",
                                    "graded",
                                    "not_graded",
                                    "dp-rewrite-republish",
                                    "wcm-active",
                                    "wcm-free_trial",
                                    "wcm-delayed",
                                    "wcm-complimentary",
                                    "wcm-pending",
                                    "wcm-paused",
                                    "wcm-expired",
                                    "wcm-cancelled",
                                    "any"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "tax_relation": {
                            "description": "Limita i risultati basati sulle relazioni tra tassonomie multiple.",
                            "type": "string",
                            "enum": [
                                "AND",
                                "OR"
                            ],
                            "required": false
                        },
                        "categories": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia categories.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "categories_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia categories.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_course_tag": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia ld_course_tag.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_course_tag_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia ld_course_tag.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST"
                    ],
                    "args": {
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "menu_order": {
                            "description": "L'ordine dell'articolo in relazione ad altri articoli.",
                            "type": "integer",
                            "required": false
                        },
                        "meta": {
                            "description": "Campi dei meta.",
                            "type": "object",
                            "properties": {
                                "footnotes": {
                                    "type": "string",
                                    "title": "",
                                    "description": "",
                                    "default": ""
                                }
                            },
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "categories": {
                            "description": "I termini assegnati all'articolo nella tassonomia category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_course_tag": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_course_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "course_materials": {
                            "description": "Guida Materiali",
                            "type": "html",
                            "required": false
                        },
                        "course_price_type": {
                            "default": "open",
                            "description": "Guida Price Type",
                            "type": "string",
                            "enum": [
                                "open",
                                "closed",
                                "free",
                                "buynow",
                                "subscribe"
                            ],
                            "required": false
                        },
                        "custom_button_label": {
                            "description": "Custom Button Label",
                            "type": "text",
                            "required": false
                        },
                        "custom_button_url": {
                            "description": "Pulsante Personalizzato URL",
                            "type": "text",
                            "required": false
                        },
                        "course_price": {
                            "description": "Guida Prezzo",
                            "type": "text",
                            "required": false
                        },
                        "course_prerequisite_enabled": {
                            "default": false,
                            "description": "Abilita Guida Prerequisiti",
                            "type": "boolean",
                            "required": false
                        },
                        "course_prerequisite": {
                            "default": [],
                            "description": "Guida Prerequisiti",
                            "type": "array",
                            "required": false
                        },
                        "course_prerequisite_compare": {
                            "default": "ANY",
                            "description": "Guida Prerequisites Compare",
                            "type": "string",
                            "enum": [
                                "ANY",
                                "ALL"
                            ],
                            "required": false
                        },
                        "course_points_enabled": {
                            "description": "Abilita Guida Punti",
                            "type": "boolean",
                            "required": false
                        },
                        "course_points": {
                            "description": "Guida Punti",
                            "type": "number",
                            "required": false
                        },
                        "course_points_access": {
                            "description": "Guida Points Access",
                            "type": "number",
                            "required": false
                        },
                        "course_disable_lesson_progression": {
                            "default": 0,
                            "description": "Disable Capitolo Progression",
                            "type": "boolean",
                            "required": false
                        },
                        "expire_access": {
                            "description": "L&#039;Accesso scade tra (giorni).",
                            "type": "boolean",
                            "required": false
                        },
                        "expire_access_days": {
                            "description": "Scadenza di accesso dopo (giorni)",
                            "type": "number",
                            "required": false
                        },
                        "expire_access_delete_progress": {
                            "description": "Delete Guida and Test Data After Expiration",
                            "type": "boolean",
                            "required": false
                        }
                    }
                }
            ],
            "_links": {
                "self": [
                    {
                        "href": "https://www.dofit.me/wp-json/ldlms/v1/sfwd-courses"
                    }
                ]
            }
        },
        "/ldlms/v1/sfwd-courses/(?P<id>[\\d]+)": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "password": {
                            "description": "La password per il post se è protetta da password.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": true
                        },
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "menu_order": {
                            "description": "L'ordine dell'articolo in relazione ad altri articoli.",
                            "type": "integer",
                            "required": false
                        },
                        "meta": {
                            "description": "Campi dei meta.",
                            "type": "object",
                            "properties": {
                                "footnotes": {
                                    "type": "string",
                                    "title": "",
                                    "description": "",
                                    "default": ""
                                }
                            },
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "categories": {
                            "description": "I termini assegnati all'articolo nella tassonomia category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_course_tag": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_course_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "course_materials": {
                            "description": "Guida Materiali",
                            "type": "html",
                            "required": false
                        },
                        "course_price_type": {
                            "description": "Guida Price Type",
                            "type": "string",
                            "enum": [
                                "open",
                                "closed",
                                "free",
                                "buynow",
                                "subscribe"
                            ],
                            "required": false
                        },
                        "custom_button_label": {
                            "description": "Custom Button Label",
                            "type": "text",
                            "required": false
                        },
                        "custom_button_url": {
                            "description": "Pulsante Personalizzato URL",
                            "type": "text",
                            "required": false
                        },
                        "course_price": {
                            "description": "Guida Prezzo",
                            "type": "text",
                            "required": false
                        },
                        "course_prerequisite_enabled": {
                            "description": "Abilita Guida Prerequisiti",
                            "type": "boolean",
                            "required": false
                        },
                        "course_prerequisite": {
                            "description": "Guida Prerequisiti",
                            "type": "array",
                            "required": false
                        },
                        "course_prerequisite_compare": {
                            "description": "Guida Prerequisites Compare",
                            "type": "string",
                            "enum": [
                                "ANY",
                                "ALL"
                            ],
                            "required": false
                        },
                        "course_points_enabled": {
                            "description": "Abilita Guida Punti",
                            "type": "boolean",
                            "required": false
                        },
                        "course_points": {
                            "description": "Guida Punti",
                            "type": "number",
                            "required": false
                        },
                        "course_points_access": {
                            "description": "Guida Points Access",
                            "type": "number",
                            "required": false
                        },
                        "course_disable_lesson_progression": {
                            "description": "Disable Capitolo Progression",
                            "type": "boolean",
                            "required": false
                        },
                        "expire_access": {
                            "description": "L&#039;Accesso scade tra (giorni).",
                            "type": "boolean",
                            "required": false
                        },
                        "expire_access_days": {
                            "description": "Scadenza di accesso dopo (giorni)",
                            "type": "number",
                            "required": false
                        },
                        "expire_access_delete_progress": {
                            "description": "Delete Guida and Test Data After Expiration",
                            "type": "boolean",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": true
                        },
                        "force": {
                            "type": "boolean",
                            "default": false,
                            "description": "Se ignorare il Cestino e forzare la cancellazione.",
                            "required": false
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/sfwd-courses/(?P<id>[\\d]+)/steps": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Guida ID to enroll user into.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "type": {
                            "description": "Filter returned results by step type.",
                            "type": "string",
                            "default": "all",
                            "enum": [
                                "all",
                                "h",
                                "l",
                                "t",
                                "r"
                            ],
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Guida ID to enroll user into.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "type": {
                            "description": "Filter returned results by step type.",
                            "type": "string",
                            "default": "all",
                            "enum": [
                                "all",
                                "h",
                                "l",
                                "t",
                                "r"
                            ],
                            "required": false
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/sfwd-courses/(?P<id>[\\d]+)/users": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Guida ID.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "fields": {
                            "description": "Valori restituiti.",
                            "type": "string",
                            "default": "ids",
                            "enum": [
                                "ids",
                                "objects"
                            ],
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "default": "asc",
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "type": "string",
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        },
                        "roles": {
                            "description": "Limita la serie di risultati agli utenti che corrispondono ad almeno uno dei ruoli indicati. Può accettare un elenco csv o un singolo ruolo.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        },
                        "slug": {
                            "description": "Limita l'insieme dei risultati agli utenti con uno o più specifici slug.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Guida ID.",
                            "type": "integer",
                            "required": true
                        },
                        "user_ids": {
                            "description": "User IDs to enroll into guida. Limit 50 per request.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "Guida ID.",
                            "type": "integer",
                            "required": true
                        },
                        "user_ids": {
                            "description": "User IDs to remove from gruppo. Limit 50 per request.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/sfwd-courses/(?P<id>[\\d]+)/groups": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Guida ID to enroll into.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "fields": {
                            "description": "Valori restituiti.",
                            "type": "string",
                            "default": "ids",
                            "enum": [
                                "ids",
                                "objects"
                            ],
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title"
                            ],
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Guida ID to enroll into.",
                            "type": "integer",
                            "required": true
                        },
                        "group_ids": {
                            "description": "Gruppo IDs to enroll into Guida.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "Guida ID to enroll into.",
                            "type": "integer",
                            "required": true
                        },
                        "group_ids": {
                            "description": "Gruppo IDs to remove from Guida.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/sfwd-lessons": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        },
                        "after": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate dopo una data fornita nello standard ISO8601. ",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_after": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati dopo una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "author": {
                            "description": "Limita la serie di risultati agli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "author_exclude": {
                            "description": "Garantisce che la serie di risultati escluda gli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "before": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate prima di una data fornita nello standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_before": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati prima di una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "menu_order": {
                            "description": "Limita la serie di risultati agli articoli con uno specifico valore menu_order.",
                            "type": "integer",
                            "required": false
                        },
                        "search_semantics": {
                            "description": "Come interpretare l'input di ricerca.",
                            "type": "string",
                            "enum": [
                                "exact"
                            ],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title",
                                "menu_order"
                            ],
                            "required": false
                        },
                        "search_columns": {
                            "default": [],
                            "description": "Array di nomi di colonna da cercare.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "post_title",
                                    "post_content",
                                    "post_excerpt"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "slug": {
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più slug specifici.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        },
                        "status": {
                            "default": "publish",
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più stati assegnati.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "publish",
                                    "future",
                                    "draft",
                                    "pending",
                                    "private",
                                    "trash",
                                    "auto-draft",
                                    "inherit",
                                    "request-pending",
                                    "request-confirmed",
                                    "request-failed",
                                    "request-completed",
                                    "ywgc-disabled",
                                    "ywgc-dismissed",
                                    "ywgc-code-not-valid",
                                    "ywgc-pre-printed",
                                    "wc-active",
                                    "wc-switched",
                                    "wc-expired",
                                    "wc-pending-cancel",
                                    "wc-pending",
                                    "wc-processing",
                                    "wc-on-hold",
                                    "wc-completed",
                                    "wc-cancelled",
                                    "wc-refunded",
                                    "wc-failed",
                                    "wc-checkout-draft",
                                    "graded",
                                    "not_graded",
                                    "dp-rewrite-republish",
                                    "wcm-active",
                                    "wcm-free_trial",
                                    "wcm-delayed",
                                    "wcm-complimentary",
                                    "wcm-pending",
                                    "wcm-paused",
                                    "wcm-expired",
                                    "wcm-cancelled",
                                    "any"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "tax_relation": {
                            "description": "Limita i risultati basati sulle relazioni tra tassonomie multiple.",
                            "type": "string",
                            "enum": [
                                "AND",
                                "OR"
                            ],
                            "required": false
                        },
                        "categories": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia categories.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "categories_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia categories.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_lesson_tag": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia ld_lesson_tag.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_lesson_tag_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia ld_lesson_tag.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "course": {
                            "description": "Limitare i risultati all&#039;interno di uno specifico Guida. Richiesto per gli utenti non amministratori.",
                            "type": "integer",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST"
                    ],
                    "args": {
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "menu_order": {
                            "description": "L'ordine dell'articolo in relazione ad altri articoli.",
                            "type": "integer",
                            "required": false
                        },
                        "meta": {
                            "description": "Campi dei meta.",
                            "type": "object",
                            "properties": {
                                "footnotes": {
                                    "type": "string",
                                    "title": "",
                                    "description": "",
                                    "default": ""
                                }
                            },
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "categories": {
                            "description": "I termini assegnati all'articolo nella tassonomia category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_lesson_tag": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_lesson_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "lesson_materials": {
                            "description": "Capitolo Materiali",
                            "type": "html",
                            "required": false
                        },
                        "forced_lesson_time": {
                            "default": "",
                            "description": "Forced Capitolo Timer",
                            "type": "text",
                            "required": false
                        },
                        "lesson_assignment_upload": {
                            "default": 0,
                            "description": "Carica Compito",
                            "type": "boolean",
                            "required": false
                        },
                        "auto_approve_assignment": {
                            "default": "on",
                            "description": "Approvazione Automatica Compito",
                            "type": "boolean",
                            "required": false
                        },
                        "assignment_upload_limit_count": {
                            "default": "1",
                            "description": "Limit number of uploaded files",
                            "type": "number",
                            "required": false
                        },
                        "lesson_assignment_deletion_enabled": {
                            "default": 0,
                            "description": "Allow Student to Delete own Assignment(s)",
                            "type": "boolean",
                            "required": false
                        },
                        "lesson_assignment_points_enabled": {
                            "default": 0,
                            "description": "Punti premio per il compito",
                            "type": "boolean",
                            "required": false
                        },
                        "lesson_assignment_points_amount": {
                            "default": 0,
                            "description": "Imposta il numero di punti per l’assegnazione",
                            "type": "number",
                            "required": false
                        },
                        "assignment_upload_limit_extensions": {
                            "default": "",
                            "description": "Estensioni di file consentite",
                            "type": "text",
                            "required": false
                        },
                        "assignment_upload_limit_size": {
                            "default": "",
                            "description": "Dimensione file consentita",
                            "type": "text",
                            "required": false
                        },
                        "visible_after": {
                            "default": 0,
                            "description": "Rende Capitolo visibile X giorni dopo l’iscrizione",
                            "type": "number",
                            "required": false
                        },
                        "visible_after_specific_date": {
                            "description": "Make Capitolo Visible on Specific Date",
                            "type": "wp_date_selector",
                            "required": false
                        }
                    }
                }
            ],
            "_links": {
                "self": [
                    {
                        "href": "https://www.dofit.me/wp-json/ldlms/v1/sfwd-lessons"
                    }
                ]
            }
        },
        "/ldlms/v1/sfwd-lessons/(?P<id>[\\d]+)": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": false
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "password": {
                            "description": "La password per il post se è protetta da password.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": false
                        },
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "menu_order": {
                            "description": "L'ordine dell'articolo in relazione ad altri articoli.",
                            "type": "integer",
                            "required": false
                        },
                        "meta": {
                            "description": "Campi dei meta.",
                            "type": "object",
                            "properties": {
                                "footnotes": {
                                    "type": "string",
                                    "title": "",
                                    "description": "",
                                    "default": ""
                                }
                            },
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "categories": {
                            "description": "I termini assegnati all'articolo nella tassonomia category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_lesson_tag": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_lesson_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "lesson_materials": {
                            "description": "Capitolo Materiali",
                            "type": "html",
                            "required": false
                        },
                        "forced_lesson_time": {
                            "description": "Forced Capitolo Timer",
                            "type": "text",
                            "required": false
                        },
                        "lesson_assignment_upload": {
                            "description": "Carica Compito",
                            "type": "boolean",
                            "required": false
                        },
                        "auto_approve_assignment": {
                            "description": "Approvazione Automatica Compito",
                            "type": "boolean",
                            "required": false
                        },
                        "assignment_upload_limit_count": {
                            "description": "Limit number of uploaded files",
                            "type": "number",
                            "required": false
                        },
                        "lesson_assignment_deletion_enabled": {
                            "description": "Allow Student to Delete own Assignment(s)",
                            "type": "boolean",
                            "required": false
                        },
                        "lesson_assignment_points_enabled": {
                            "description": "Punti premio per il compito",
                            "type": "boolean",
                            "required": false
                        },
                        "lesson_assignment_points_amount": {
                            "description": "Imposta il numero di punti per l’assegnazione",
                            "type": "number",
                            "required": false
                        },
                        "assignment_upload_limit_extensions": {
                            "description": "Estensioni di file consentite",
                            "type": "text",
                            "required": false
                        },
                        "assignment_upload_limit_size": {
                            "description": "Dimensione file consentita",
                            "type": "text",
                            "required": false
                        },
                        "visible_after": {
                            "description": "Rende Capitolo visibile X giorni dopo l’iscrizione",
                            "type": "number",
                            "required": false
                        },
                        "visible_after_specific_date": {
                            "description": "Make Capitolo Visible on Specific Date",
                            "type": "wp_date_selector",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": false
                        },
                        "force": {
                            "type": "boolean",
                            "default": false,
                            "description": "Se ignorare il Cestino e forzare la cancellazione.",
                            "required": false
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/sfwd-topic": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        },
                        "after": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate dopo una data fornita nello standard ISO8601. ",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_after": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati dopo una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "author": {
                            "description": "Limita la serie di risultati agli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "author_exclude": {
                            "description": "Garantisce che la serie di risultati escluda gli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "before": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate prima di una data fornita nello standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_before": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati prima di una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "menu_order": {
                            "description": "Limita la serie di risultati agli articoli con uno specifico valore menu_order.",
                            "type": "integer",
                            "required": false
                        },
                        "search_semantics": {
                            "description": "Come interpretare l'input di ricerca.",
                            "type": "string",
                            "enum": [
                                "exact"
                            ],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title",
                                "menu_order"
                            ],
                            "required": false
                        },
                        "search_columns": {
                            "default": [],
                            "description": "Array di nomi di colonna da cercare.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "post_title",
                                    "post_content",
                                    "post_excerpt"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "slug": {
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più slug specifici.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        },
                        "status": {
                            "default": "publish",
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più stati assegnati.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "publish",
                                    "future",
                                    "draft",
                                    "pending",
                                    "private",
                                    "trash",
                                    "auto-draft",
                                    "inherit",
                                    "request-pending",
                                    "request-confirmed",
                                    "request-failed",
                                    "request-completed",
                                    "ywgc-disabled",
                                    "ywgc-dismissed",
                                    "ywgc-code-not-valid",
                                    "ywgc-pre-printed",
                                    "wc-active",
                                    "wc-switched",
                                    "wc-expired",
                                    "wc-pending-cancel",
                                    "wc-pending",
                                    "wc-processing",
                                    "wc-on-hold",
                                    "wc-completed",
                                    "wc-cancelled",
                                    "wc-refunded",
                                    "wc-failed",
                                    "wc-checkout-draft",
                                    "graded",
                                    "not_graded",
                                    "dp-rewrite-republish",
                                    "wcm-active",
                                    "wcm-free_trial",
                                    "wcm-delayed",
                                    "wcm-complimentary",
                                    "wcm-pending",
                                    "wcm-paused",
                                    "wcm-expired",
                                    "wcm-cancelled",
                                    "any"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "tax_relation": {
                            "description": "Limita i risultati basati sulle relazioni tra tassonomie multiple.",
                            "type": "string",
                            "enum": [
                                "AND",
                                "OR"
                            ],
                            "required": false
                        },
                        "categories": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia categories.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "categories_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia categories.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "tags": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia tags.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "tags_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia tags.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_topic_tag": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia ld_topic_tag.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_topic_tag_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia ld_topic_tag.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "course": {
                            "description": "Limitare i risultati all&#039;interno di uno specifico Guida. Richiesto per gli utenti non amministratori.",
                            "type": "integer",
                            "required": false
                        },
                        "lesson": {
                            "description": "Limitare i risultati all&#039;interno di uno specifico Capitolo. deve essere utilizzato con il parametro del corso.",
                            "type": "integer",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST"
                    ],
                    "args": {
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "menu_order": {
                            "description": "L'ordine dell'articolo in relazione ad altri articoli.",
                            "type": "integer",
                            "required": false
                        },
                        "meta": {
                            "description": "Campi dei meta.",
                            "type": "object",
                            "properties": {
                                "footnotes": {
                                    "type": "string",
                                    "title": "",
                                    "description": "",
                                    "default": ""
                                }
                            },
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "categories": {
                            "description": "I termini assegnati all'articolo nella tassonomia category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "tags": {
                            "description": "I termini assegnati all'articolo nella tassonomia post_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_topic_tag": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_topic_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "topic_materials": {
                            "description": "Modulo Materiali",
                            "type": "html",
                            "required": false
                        },
                        "forced_lesson_time": {
                            "default": "",
                            "description": "Forced Modulo Timer",
                            "type": "text",
                            "required": false
                        },
                        "lesson_assignment_upload": {
                            "default": 0,
                            "description": "Carica Compito",
                            "type": "boolean",
                            "required": false
                        },
                        "auto_approve_assignment": {
                            "default": "on",
                            "description": "Approvazione Automatica Compito",
                            "type": "boolean",
                            "required": false
                        },
                        "assignment_upload_limit_count": {
                            "default": "1",
                            "description": "Limit number of uploaded files",
                            "type": "number",
                            "required": false
                        },
                        "lesson_assignment_points_enabled": {
                            "default": 0,
                            "description": "Punti premio per il compito",
                            "type": "boolean",
                            "required": false
                        },
                        "lesson_assignment_points_amount": {
                            "default": 0,
                            "description": "Imposta il numero di punti per l’assegnazione",
                            "type": "number",
                            "required": false
                        },
                        "assignment_upload_limit_extensions": {
                            "default": "",
                            "description": "Estensioni di file consentite",
                            "type": "text",
                            "required": false
                        },
                        "assignment_upload_limit_size": {
                            "default": "",
                            "description": "Dimensione file consentita",
                            "type": "text",
                            "required": false
                        }
                    }
                }
            ],
            "_links": {
                "self": [
                    {
                        "href": "https://www.dofit.me/wp-json/ldlms/v1/sfwd-topic"
                    }
                ]
            }
        },
        "/ldlms/v1/sfwd-topic/(?P<id>[\\d]+)": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": false
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "password": {
                            "description": "La password per il post se è protetta da password.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": false
                        },
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "menu_order": {
                            "description": "L'ordine dell'articolo in relazione ad altri articoli.",
                            "type": "integer",
                            "required": false
                        },
                        "meta": {
                            "description": "Campi dei meta.",
                            "type": "object",
                            "properties": {
                                "footnotes": {
                                    "type": "string",
                                    "title": "",
                                    "description": "",
                                    "default": ""
                                }
                            },
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "categories": {
                            "description": "I termini assegnati all'articolo nella tassonomia category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "tags": {
                            "description": "I termini assegnati all'articolo nella tassonomia post_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_topic_tag": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_topic_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "topic_materials": {
                            "description": "Modulo Materiali",
                            "type": "html",
                            "required": false
                        },
                        "forced_lesson_time": {
                            "description": "Forced Modulo Timer",
                            "type": "text",
                            "required": false
                        },
                        "lesson_assignment_upload": {
                            "description": "Carica Compito",
                            "type": "boolean",
                            "required": false
                        },
                        "auto_approve_assignment": {
                            "description": "Approvazione Automatica Compito",
                            "type": "boolean",
                            "required": false
                        },
                        "assignment_upload_limit_count": {
                            "description": "Limit number of uploaded files",
                            "type": "number",
                            "required": false
                        },
                        "lesson_assignment_points_enabled": {
                            "description": "Punti premio per il compito",
                            "type": "boolean",
                            "required": false
                        },
                        "lesson_assignment_points_amount": {
                            "description": "Imposta il numero di punti per l’assegnazione",
                            "type": "number",
                            "required": false
                        },
                        "assignment_upload_limit_extensions": {
                            "description": "Estensioni di file consentite",
                            "type": "text",
                            "required": false
                        },
                        "assignment_upload_limit_size": {
                            "description": "Dimensione file consentita",
                            "type": "text",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": false
                        },
                        "force": {
                            "type": "boolean",
                            "default": false,
                            "description": "Se ignorare il Cestino e forzare la cancellazione.",
                            "required": false
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/sfwd-quiz": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        },
                        "after": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate dopo una data fornita nello standard ISO8601. ",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_after": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati dopo una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "author": {
                            "description": "Limita la serie di risultati agli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "author_exclude": {
                            "description": "Garantisce che la serie di risultati escluda gli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "before": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate prima di una data fornita nello standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_before": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati prima di una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "menu_order": {
                            "description": "Limita la serie di risultati agli articoli con uno specifico valore menu_order.",
                            "type": "integer",
                            "required": false
                        },
                        "search_semantics": {
                            "description": "Come interpretare l'input di ricerca.",
                            "type": "string",
                            "enum": [
                                "exact"
                            ],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title",
                                "menu_order"
                            ],
                            "required": false
                        },
                        "search_columns": {
                            "default": [],
                            "description": "Array di nomi di colonna da cercare.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "post_title",
                                    "post_content",
                                    "post_excerpt"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "slug": {
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più slug specifici.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        },
                        "status": {
                            "default": "publish",
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più stati assegnati.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "publish",
                                    "future",
                                    "draft",
                                    "pending",
                                    "private",
                                    "trash",
                                    "auto-draft",
                                    "inherit",
                                    "request-pending",
                                    "request-confirmed",
                                    "request-failed",
                                    "request-completed",
                                    "ywgc-disabled",
                                    "ywgc-dismissed",
                                    "ywgc-code-not-valid",
                                    "ywgc-pre-printed",
                                    "wc-active",
                                    "wc-switched",
                                    "wc-expired",
                                    "wc-pending-cancel",
                                    "wc-pending",
                                    "wc-processing",
                                    "wc-on-hold",
                                    "wc-completed",
                                    "wc-cancelled",
                                    "wc-refunded",
                                    "wc-failed",
                                    "wc-checkout-draft",
                                    "graded",
                                    "not_graded",
                                    "dp-rewrite-republish",
                                    "wcm-active",
                                    "wcm-free_trial",
                                    "wcm-delayed",
                                    "wcm-complimentary",
                                    "wcm-pending",
                                    "wcm-paused",
                                    "wcm-expired",
                                    "wcm-cancelled",
                                    "any"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "course": {
                            "description": "Limitare i risultati all&#039;interno di uno specifico Guida. Richiesto per gli utenti non amministratori.",
                            "type": "integer",
                            "required": false
                        },
                        "lesson": {
                            "description": "Limitare i risultati all&#039;interno di uno specifico Capitolo. Passare zero per mostrare Global Guida Test. deve essere utilizzato con il  parametro del corso.",
                            "type": "integer",
                            "required": false
                        },
                        "topic": {
                            "description": "Limitare i risultati all&#039;interno di uno specifico Modulo. deve essere utilizzato con il parametro del corso.",
                            "type": "integer",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST"
                    ],
                    "args": {
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "menu_order": {
                            "description": "L'ordine dell'articolo in relazione ad altri articoli.",
                            "type": "integer",
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "quiz_materials": {
                            "description": "Test Materiali",
                            "type": "html",
                            "required": false
                        },
                        "threshold": {
                            "default": "0.8",
                            "description": "Soglia del Certificato",
                            "type": "text",
                            "required": false
                        },
                        "passingpercentage": {
                            "default": "80",
                            "description": "Percentuale di Passaggio",
                            "type": "text",
                            "required": false
                        },
                        "certificate": {
                            "default": "",
                            "description": "Certificato Associato",
                            "type": "string",
                            "required": false
                        }
                    }
                }
            ],
            "_links": {
                "self": [
                    {
                        "href": "https://www.dofit.me/wp-json/ldlms/v1/sfwd-quiz"
                    }
                ]
            }
        },
        "/ldlms/v1/sfwd-quiz/(?P<id>[\\d]+)": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Unique identifier for the test object.",
                            "type": "integer",
                            "required": false
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "password": {
                            "description": "La password per il post se è protetta da password.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Unique identifier for the test object.",
                            "type": "integer",
                            "required": false
                        },
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "menu_order": {
                            "description": "L'ordine dell'articolo in relazione ad altri articoli.",
                            "type": "integer",
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "quiz_materials": {
                            "description": "Test Materiali",
                            "type": "html",
                            "required": false
                        },
                        "threshold": {
                            "description": "Soglia del Certificato",
                            "type": "text",
                            "required": false
                        },
                        "passingpercentage": {
                            "description": "Percentuale di Passaggio",
                            "type": "text",
                            "required": false
                        },
                        "certificate": {
                            "description": "Certificato Associato",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "Unique identifier for the test object.",
                            "type": "integer",
                            "required": false
                        },
                        "force": {
                            "type": "boolean",
                            "default": false,
                            "description": "Se ignorare il Cestino e forzare la cancellazione.",
                            "required": false
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/groups": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        },
                        "after": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate dopo una data fornita nello standard ISO8601. ",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_after": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati dopo una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "author": {
                            "description": "Limita la serie di risultati agli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "author_exclude": {
                            "description": "Garantisce che la serie di risultati escluda gli articoli assegnati ad autori specifici.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "before": {
                            "description": "Limita l'insieme dei risultati a risorse pubblicate prima di una data fornita nello standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "modified_before": {
                            "description": "Limita l'insieme dei risultati agli articoli pubblicati prima di una determinata data conforme allo standard ISO8601.",
                            "type": "string",
                            "format": "date-time",
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "search_semantics": {
                            "description": "Come interpretare l'input di ricerca.",
                            "type": "string",
                            "enum": [
                                "exact"
                            ],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title"
                            ],
                            "required": false
                        },
                        "search_columns": {
                            "default": [],
                            "description": "Array di nomi di colonna da cercare.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "post_title",
                                    "post_content",
                                    "post_excerpt"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "slug": {
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più slug specifici.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        },
                        "status": {
                            "default": "publish",
                            "description": "Limita l'insieme dei risultati agli articoli con uno o più stati assegnati.",
                            "type": "array",
                            "items": {
                                "enum": [
                                    "publish",
                                    "future",
                                    "draft",
                                    "pending",
                                    "private",
                                    "trash",
                                    "auto-draft",
                                    "inherit",
                                    "request-pending",
                                    "request-confirmed",
                                    "request-failed",
                                    "request-completed",
                                    "ywgc-disabled",
                                    "ywgc-dismissed",
                                    "ywgc-code-not-valid",
                                    "ywgc-pre-printed",
                                    "wc-active",
                                    "wc-switched",
                                    "wc-expired",
                                    "wc-pending-cancel",
                                    "wc-pending",
                                    "wc-processing",
                                    "wc-on-hold",
                                    "wc-completed",
                                    "wc-cancelled",
                                    "wc-refunded",
                                    "wc-failed",
                                    "wc-checkout-draft",
                                    "graded",
                                    "not_graded",
                                    "dp-rewrite-republish",
                                    "wcm-active",
                                    "wcm-free_trial",
                                    "wcm-delayed",
                                    "wcm-complimentary",
                                    "wcm-pending",
                                    "wcm-paused",
                                    "wcm-expired",
                                    "wcm-cancelled",
                                    "any"
                                ],
                                "type": "string"
                            },
                            "required": false
                        },
                        "tax_relation": {
                            "description": "Limita i risultati basati sulle relazioni tra tassonomie multiple.",
                            "type": "string",
                            "enum": [
                                "AND",
                                "OR"
                            ],
                            "required": false
                        },
                        "categories": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia categories.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "categories_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia categories.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "tags": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia tags.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "tags_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia tags.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_group_category": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia ld_group_category.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_group_category_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia ld_group_category.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "include_children": {
                                            "description": "Se i termini figli sono inclusi nei termini che limitano il set di risultati.",
                                            "type": "boolean",
                                            "default": false
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_group_tag": {
                            "description": "Limita l'insieme dei risultati agli elementi con i termini specifici assegnati nella tassonomia ld_group_tag.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        },
                                        "operator": {
                                            "description": "Se gli elementi devono essere assegnati a tutti o ad alcuni dei termini specificati.",
                                            "type": "string",
                                            "enum": [
                                                "AND",
                                                "OR"
                                            ],
                                            "default": "OR"
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        },
                        "ld_group_tag_exclude": {
                            "description": "Limita l'insieme dei risultati agli elementi tranne quelli con termini specifici assegnati nella tassonomia ld_group_tag.",
                            "type": [
                                "object",
                                "array"
                            ],
                            "oneOf": [
                                {
                                    "title": "Elenco degli ID dei termini",
                                    "description": "Abbina i termini con gli ID elencati.",
                                    "type": "array",
                                    "items": {
                                        "type": "integer"
                                    }
                                },
                                {
                                    "title": "Query della tassonomia dell'ID del termine",
                                    "description": "Esegui una query avanzata dei termini.",
                                    "type": "object",
                                    "properties": {
                                        "terms": {
                                            "description": "ID di termini.",
                                            "type": "array",
                                            "items": {
                                                "type": "integer"
                                            },
                                            "default": []
                                        }
                                    },
                                    "additionalProperties": false
                                }
                            ],
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST"
                    ],
                    "args": {
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "categories": {
                            "description": "I termini assegnati all'articolo nella tassonomia category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "tags": {
                            "description": "I termini assegnati all'articolo nella tassonomia post_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_group_category": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_group_category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_group_tag": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_group_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        }
                    }
                }
            ],
            "_links": {
                "self": [
                    {
                        "href": "https://www.dofit.me/wp-json/ldlms/v1/groups"
                    }
                ]
            }
        },
        "/ldlms/v1/groups/(?P<id>[\\d]+)": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "password": {
                            "description": "La password per il post se è protetta da password.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": true
                        },
                        "date": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario del sito.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "date_gmt": {
                            "description": "La data di pubblicazione dell'articolo, nel fuso orario GMT.",
                            "type": [
                                "string",
                                "null"
                            ],
                            "format": "date-time",
                            "required": false
                        },
                        "slug": {
                            "description": "Un identificatore alfanumerico per l'articolo unico di questo tipo.",
                            "type": "string",
                            "required": false
                        },
                        "status": {
                            "description": "Uno stato con nome per l'articolo.",
                            "type": "string",
                            "enum": [
                                "publish",
                                "future",
                                "draft",
                                "pending",
                                "private",
                                "ywgc-disabled",
                                "ywgc-dismissed",
                                "ywgc-code-not-valid",
                                "ywgc-pre-printed",
                                "wc-active",
                                "wc-switched",
                                "wc-expired",
                                "wc-pending-cancel",
                                "wc-pending",
                                "wc-processing",
                                "wc-on-hold",
                                "wc-completed",
                                "wc-cancelled",
                                "wc-refunded",
                                "wc-failed",
                                "wc-checkout-draft",
                                "graded",
                                "not_graded",
                                "wcm-active",
                                "wcm-free_trial",
                                "wcm-delayed",
                                "wcm-complimentary",
                                "wcm-pending",
                                "wcm-paused",
                                "wcm-expired",
                                "wcm-cancelled"
                            ],
                            "required": false
                        },
                        "password": {
                            "description": "Una password per proteggere l'accesso al contenuto e al riassunto.",
                            "type": "string",
                            "required": false
                        },
                        "title": {
                            "description": "Il titolo dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il titolo dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Titolo HTML per l'articolo, trasformato per la visualizzazione.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "content": {
                            "description": "Il contenuto dell'articolo.",
                            "type": "object",
                            "properties": {
                                "raw": {
                                    "description": "Il contenuto dell'articolo, come riportato nel database.",
                                    "type": "string",
                                    "context": [
                                        "edit"
                                    ]
                                },
                                "rendered": {
                                    "description": "Contenuto HTML dell'articolo, trasformato per essere visualizzato.",
                                    "type": "string",
                                    "context": [
                                        "view",
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "block_version": {
                                    "description": "Versione del formato del blocco di contenuto utilizzata dall'articolo.",
                                    "type": "integer",
                                    "context": [
                                        "edit"
                                    ],
                                    "readonly": true
                                },
                                "protected": {
                                    "description": "Se il contenuto è protetto da password oppure no.",
                                    "type": "boolean",
                                    "context": [
                                        "view",
                                        "edit",
                                        "embed"
                                    ],
                                    "readonly": true
                                }
                            },
                            "required": false
                        },
                        "author": {
                            "description": "L'ID dell'autore dell'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "featured_media": {
                            "description": "L'id del media in evidenza per l'articolo.",
                            "type": "integer",
                            "required": false
                        },
                        "template": {
                            "description": "Il file del tema da utilizzare per visualizzare l'articolo.",
                            "type": "string",
                            "required": false
                        },
                        "categories": {
                            "description": "I termini assegnati all'articolo nella tassonomia category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "tags": {
                            "description": "I termini assegnati all'articolo nella tassonomia post_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_group_category": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_group_category.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        },
                        "ld_group_tag": {
                            "description": "I termini assegnati all'articolo nella tassonomia ld_group_tag.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "Identificatore univoco per l&#039;oggetto.",
                            "type": "integer",
                            "required": true
                        },
                        "force": {
                            "type": "boolean",
                            "default": false,
                            "description": "Se ignorare il Cestino e forzare la cancellazione.",
                            "required": false
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/groups/(?P<id>[\\d]+)/courses": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "Gruppo ID to enroll into.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "fields": {
                            "description": "Valori restituiti.",
                            "type": "string",
                            "default": "ids",
                            "enum": [
                                "ids",
                                "objects"
                            ],
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title",
                                "menu_order"
                            ],
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "Gruppo ID to enroll into.",
                            "type": "integer",
                            "required": true
                        },
                        "course_ids": {
                            "description": "Guida IDs to enroll into gruppo.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "Gruppo ID to enroll into.",
                            "type": "integer",
                            "required": true
                        },
                        "course_ids": {
                            "description": "Guida IDs to remove from gruppo.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/groups/(?P<id>[\\d]+)/leaders": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "gruppo ID to enroll group leader into.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "fields": {
                            "description": "Valori restituiti.",
                            "type": "string",
                            "default": "ids",
                            "enum": [
                                "ids",
                                "objects"
                            ],
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "default": "asc",
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "type": "string",
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        },
                        "roles": {
                            "description": "Limita la serie di risultati agli utenti che corrispondono ad almeno uno dei ruoli indicati. Può accettare un elenco csv o un singolo ruolo.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        },
                        "slug": {
                            "description": "Limita l'insieme dei risultati agli utenti con uno o più specifici slug.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "gruppo ID to enroll group leader into.",
                            "type": "integer",
                            "required": true
                        },
                        "user_ids": {
                            "description": "Group Leader User IDs to enroll into Gruppo",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "gruppo ID to enroll group leader into.",
                            "type": "integer",
                            "required": true
                        },
                        "user_ids": {
                            "description": "Group Leader User IDs to remove from Gruppo",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/groups/(?P<id>[\\d]+)/users": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "gruppo ID to enroll group leader into.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "fields": {
                            "description": "Valori restituiti.",
                            "type": "string",
                            "default": "ids",
                            "enum": [
                                "ids",
                                "objects"
                            ],
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "default": "asc",
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "type": "string",
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        },
                        "roles": {
                            "description": "Limita la serie di risultati agli utenti che corrispondono ad almeno uno dei ruoli indicati. Può accettare un elenco csv o un singolo ruolo.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        },
                        "slug": {
                            "description": "Limita l'insieme dei risultati agli utenti con uno o più specifici slug.",
                            "type": "array",
                            "items": {
                                "type": "string"
                            },
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "gruppo ID to enroll group leader into.",
                            "type": "integer",
                            "required": true
                        },
                        "user_ids": {
                            "description": "IDs utente per iscriversi al gruppo.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "gruppo ID to enroll group leader into.",
                            "type": "integer",
                            "required": true
                        },
                        "user_ids": {
                            "description": "IDs utente da rimuovere dal gruppo.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/users/(?P<id>[\\d]+)/groups": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "ID Utente",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "fields": {
                            "description": "Valori restituiti.",
                            "type": "string",
                            "default": "ids",
                            "enum": [
                                "ids",
                                "objects"
                            ],
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title"
                            ],
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "ID Utente",
                            "type": "integer",
                            "required": true
                        },
                        "group_ids": {
                            "description": "Gruppo IDs to add to User.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "ID Utente",
                            "type": "integer",
                            "required": true
                        },
                        "group_ids": {
                            "description": "Gruppo IDs to remove from User.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/users/(?P<id>[\\d]+)/courses": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "User ID to enroll user into.",
                            "type": "integer",
                            "required": true
                        },
                        "context": {
                            "description": "Scopo della richiesta; determina i campi che saranno presenti nella risposta.",
                            "type": "string",
                            "enum": [
                                "view",
                                "embed",
                                "edit"
                            ],
                            "default": "view",
                            "required": false
                        },
                        "fields": {
                            "description": "Valori restituiti.",
                            "type": "string",
                            "default": "ids",
                            "enum": [
                                "ids",
                                "objects"
                            ],
                            "required": false
                        },
                        "exclude": {
                            "description": "Esclude specifici ID dall'insieme dei risultati.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "include": {
                            "description": "Limita l'insieme dei risultati a specifici ID.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "default": [],
                            "required": false
                        },
                        "offset": {
                            "description": "Sposta di uno specifico numero di elementi l'inizio dell'insieme dei risultati.",
                            "type": "integer",
                            "required": false
                        },
                        "order": {
                            "description": "Attributo per l'ordinamento ascendente o discendente.",
                            "type": "string",
                            "default": "asc",
                            "enum": [
                                "asc",
                                "desc"
                            ],
                            "required": false
                        },
                        "orderby": {
                            "description": "Ordina la raccolta in base ad un attributo dell'articolo.",
                            "type": "string",
                            "default": "title",
                            "enum": [
                                "author",
                                "date",
                                "id",
                                "include",
                                "modified",
                                "parent",
                                "relevance",
                                "slug",
                                "include_slugs",
                                "title",
                                "menu_order"
                            ],
                            "required": false
                        },
                        "per_page": {
                            "description": "Numero massimo dei risultati da restituire nella serie dei risultati.",
                            "type": "integer",
                            "default": 10,
                            "minimum": 1,
                            "maximum": 100,
                            "required": false
                        },
                        "page": {
                            "description": "Pagina corrente dell'elenco.",
                            "type": "integer",
                            "default": 1,
                            "minimum": 1,
                            "required": false
                        },
                        "search": {
                            "description": "Limita la serie di risultati a quelli contententi una stringa.",
                            "type": "string",
                            "required": false
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "User ID to enroll user into.",
                            "type": "integer",
                            "required": true
                        },
                        "course_ids": {
                            "description": "Guide IDs to add to User.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "User ID to enroll user into.",
                            "type": "integer",
                            "required": true
                        },
                        "course_ids": {
                            "description": "Guide IDs to remove from User.",
                            "type": "array",
                            "items": {
                                "type": "integer"
                            },
                            "required": true
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/sfwd-questions/(?P<id>[\\d]+)": {
            "namespace": "ldlms/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "description": "The domanda ID",
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "description": "The domanda ID",
                            "required": true
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "description": "The domanda ID",
                            "required": true
                        }
                    }
                }
            ]
        },
        "/ldlms/v1/sections/(?P<id>[\\d]+)": {
            "namespace": "ldlms/v1",
            "methods": [
                "POST",
                "PUT",
                "PATCH"
            ],
            "endpoints": [
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "required": true
                        }
                    }
                }
            ]
        }
    },
    "_links": {
        "up": [
            {
                "href": "https://www.dofit.me/wp-json/"
            }
        ]
    }
}
```