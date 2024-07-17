using  MyService as call from './service';

annotate call.Hijo with @(
    UI.LineItem #ejemplo: [
        {
            $Type : 'UI.DataField',
            Value : padre1_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : padre2_ID,
        },
    ]
);

annotate call.Hijo with {
    padre2 @( Common : {
        Text : padre2.campo,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Padre2',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : padre2_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'campo',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'campo2',
                },
            ],
        },

    })
}
annotate call.Padre with {
    image_test @odata.draft.skip @Core.ContentDisposition.Filename: filename;
};


annotate call.Padre with @odata.draft.enabled @(

    Common.SideEffects :{
        $Type : 'Common.SideEffectsType',
        SourceProperties : [
            hijos.padre1_ID
        ],
        TargetEntities : [
            hijos
        ],
    },
    UI.LineItem : [
        {Value : campo},
        {
            Value : image_test,
        },
    ],
    UI.FieldGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : campo,
            },
            {
                $Type : 'UI.DataField',
                Value : hijos.padre2_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : image_test,
            },

        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup',
            ID : 'aaaa',
            Label : 'PADRE',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target : 'hijos/@UI.LineItem#ejemplo',
            Label : 'HIJO',
            ID : 'bbbb',
        },
        
    ],
);