import { Button } from "primereact/button"
import { Column } from "primereact/column"
import { DataTable } from "primereact/datatable"
import { useNavigate } from "react-router-dom"

export const EmpresaExterna = () => {
    const navigate = useNavigate()

    const candidatos = [
        { nombre: 'Christian', apellido: 'Aponte', correo: 'christian@gmail.com', telefono: '921283872', curriculo: 'cv_christian', plataforma: 'Linkedin', continua: 'SI' },
        { nombre: 'Marcos', apellido: 'Guerrero', correo: 'marcos@gmail.com', telefono: '992675372', curriculo: 'cv_marcos', plataforma: 'Bumeran', continua: 'SI' },
        { nombre: 'Pilar', apellido: 'Macute', correo: 'pilar@gmail.com', telefono: '903827387', curriculo: 'cv_pilar', plataforma: 'Computrabajo', continua: 'NO' },
    ]

    const data = [
        { nombre: 'BukPeru', correo: 'contacto@buk.com.pe', celular: '918727622', fec_entrega: '19/07/2022' },
        { nombre: 'Etalentum', correo: 'contacto@etalentum.com', celular: '962876379', fec_entrega: '21/07/2022' },
        { nombre: 'Manpower', correo: 'contacto@manpower.com', celular: '902883676', fec_entrega: '28/07/2022' },
    ]


    const goToEditEmpresa = () => {
        navigate('/editar_empresa_externa');
    }

    return (
        <div>
            <h4>Empresa Externas</h4>
            <DataTable value={data} className="mt-5" responsiveLayout="scroll">
                <Column field="nombre" header="Nombre"></Column>
                <Column field="correo" header="Correo Electronico"></Column>
                <Column field="celular" header="Telefono/Celular"></Column>
                <Column field="fec_entrega" header="Fecha Entrega"></Column>
            </DataTable>
            <div className="flex mt-2" style={{ gap: 10 }}>
                <Button icon="pi pi-plus" />
                <Button onClick={goToEditEmpresa} icon="pi pi-pencil" />
                <Button icon="pi pi-times" />
            </div>

            <h4>Candidatos </h4>
            <DataTable value={candidatos} className="mt-5" responsiveLayout="scroll">
                <Column field="nombre" header="Nombre"></Column>
                <Column field="apellido" header="Apellido"></Column>
                <Column field="correo" header="Correo Electronico"></Column>
                <Column field="telefono" header="Telefono"></Column>
                <Column field="curriculo" header="Curriculo"></Column>
                <Column field="plataforma" header="Plataforma"></Column>
                <Column field="continua" header="Estado Proceso"></Column>
            </DataTable>
        </div>
    )
}
