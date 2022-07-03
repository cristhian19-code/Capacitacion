import { Button } from "primereact/button";
import { Column } from "primereact/column";
import { DataTable } from "primereact/datatable";

export const IngresarCandidatoExterno = () => {
    const onAddCandidatoExterno = (e) => {
        e.preventDefault();
    }

    const data = [
        { nombre: 'Christian', apellido: 'Aponte', correo: 'christian@gmail.com', telefono: '921283872', curriculo: 'cv_christian', plataforma: 'Linkedin', continua: 'SI' },
        { nombre: 'Marcos', apellido: 'Guerrero', correo: 'marcos@gmail.com', telefono: '992675372', curriculo: 'cv_marcos', plataforma: 'Bumeran', continua: 'SI' },
        { nombre: 'Pilar', apellido: 'Macute', correo: 'pilar@gmail.com', telefono: '903827387', curriculo: 'cv_pilar', plataforma: 'Computrabajo', continua: 'NO' },
    ]

    return (
        <div className="px-3 flex flex-column justify-content-center align-items-center">
            <h1 className='text-white mt-7'>Solicitud Postulante</h1>


            <form className='mt-3 bg-white text-black p-5 border-round mb-5' onSubmit={onAddCandidatoExterno} style={{ width: 750 }}>
                <h4>Informacion de la Publicacion</h4>
                <table>
                    <colgroup>
                        <col style={{ width: '30%' }} />
                        <col style={{ width: '70%' }} />
                    </colgroup>
                    <tr>
                        <td>Nombre del Cargo:</td>
                        <td>Jefe de Contabilidad</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Descripcion del Trabajo:</td>
                        <td>Se necesita profesional para realizar contabilidad de toda la campaña</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Perfil del Cargo:</td>
                        <td>El candidato debe ser proactivo en habilidades de liderazgo y trabajo en equipo</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Requisitos:</td>
                        <td>Cuatro años de experiencia en sistemas de contabilidad</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Ubicacion:</td>
                        <td></td>
                    </tr>
                    <br />
                </table>

                <h4>Candidatos </h4>
                <DataTable value={data} className="mt-5" responsiveLayout="scroll">
                    <Column field="nombre" header="Nombre"></Column>
                    <Column field="apellido" header="Apellido"></Column>
                    <Column field="correo" header="Correo Electronico"></Column>
                    <Column field="telefono" header="Telefono"></Column>
                    <Column field="curriculo" header="Curriculo"></Column>
                    <Column field="plataforma" header="Plataforma"></Column>
                    <Column field="continua" header="Estado Proceso"></Column>
                </DataTable>

                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                    <Button className='p-button-primary p-button-sm' icon="pi pi-arrow-right" label="Siguiente" />
                </div>
            </form>
        </div>
    )
}
