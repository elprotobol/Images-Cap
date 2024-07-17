const cds = require('@sap/cds')

let variable_aux_imagen;

let v

let hexa


module.exports = async (srv) => {

    const {Padre} = cds.entities;


    srv.before (['CREATE', 'UPDATE'], 'Padre.drafts', async (req) => {

        if (req.data.image_test) {
            console.log('ESTO ES IMAGEN');
            // console.log(req.data);
            variable_aux_imagen = req.data.image_test;
            bufferTest = variable_aux_imagen._readableState.buffer;
            console.log(bufferTest[0]);
            v= bufferTest[0]
            //console.log(variable_aux_imagen);
            // console.log(variable_aux_imagen);
            // hexa = variable_aux_imagen.toString(16);
            // console.log(hexa);
            // console.log(typeof(hexa));
        }
    });


/*     srv.before('READ', 'Padre', async (req) => {

            console.log('ESTO ES IMAGEN');
            console.log(req.data);
            // console.log(req.data);
/*             variable_aux_imagen = req.data.image_test;
            bufferTest = variable_aux_imagen._readableState.buffer;
            console.log(bufferTest[0]);
            v= bufferTest[0] */
            //console.log(variable_aux_imagen);
            // console.log(variable_aux_imagen);
            // hexa = variable_aux_imagen.toString(16);
            // console.log(hexa);
            // console.log(typeof(hexa));

        
    //});


    
    
    srv.before(['CREATE', 'UPDATE'],'Padre', async (req) => {


        const tx = cds.transaction(req);

        let select =await tx.run(`SELECT * FROM db_padre`);

        console.log(select);

        let P = await tx.run(UPDATE('MyService.Padre').set({image_test: v}).where({ID: req.data.ID}));

        console.log(P);
    })



}