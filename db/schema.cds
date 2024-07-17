namespace db;

using {cuid,

} from '@sap/cds/common';

using {Attachments} from '@cap-js/attachments';


entity Padre : cuid {
    campo     : String(100);
    hijos     : Composition of many Hijo
                    on hijos.padre1 = $self;
    image     : Composition of many Attachments;
    image_test     : LargeBinary @Core.MediaType: 'image/png';
    imageType : String      @Core.IsMediaType;
    filename : String;
};

entity Hijo : cuid {
    padre1 : Association to Padre;
    padre2 : Association to Padre2;
}

entity Padre2 : cuid {
    campo  : String(100);
    campo2 : String(100);
}

/* aspect MediaData           @(_is_media_data) {
    url      : String;
    content  : LargeBinary @title: 'Attachment'; // only for db-based services
    mimeType : String      @title: 'Media Type' default 'application/octet-stream';
    filename : String      @title: 'Filename';
    status   : String      @title: 'Scan Status' enum {
        Unscanned;
        Scanning;
        Infected;
        Clean;
        Failed;
    } default 'Unscanned';
}

annotate MediaData with @UI.MediaResource: {Stream: content} {
    content  @Core.MediaType             : mimeType  @odata.draft.skip;
    mimeType @Core.IsMediaType;
    status   @readonly;
}


aspect Attachments : managed, cuid, MediaData {
    note : String @title: 'Note';
}
// -- Fiori Annotations ----------------------------------------------------------


annotate Attachments with @UI: {
    HeaderInfo: {
        TypeName      : '{i18n>Attachment}',
        TypeNamePlural: '{i18n>Attachments}',
    },
    FieldGroup #attachment : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : content,
            },
        ],
    },
    Facets  : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#attachment',
            ID : 'attachment',
            Label : '{i18n>Attachment}',
        },

    ],
} {
    content
    @Core.ContentDisposition : {
        Filename: filename,
        Type    : 'inline'
    }
    @Core.Immutable
} */
