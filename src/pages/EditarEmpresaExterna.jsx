import { Button } from "primereact/button"
import { Column } from "primereact/column"
import { DataTable } from "primereact/datatable"
import { Dropdown } from 'primereact/dropdown'
export const EditarEmpresaExterna = () => {
    const data = [
        { tip_documento: 'docx', fec_entrega: '15/08/2022', participantes: 'Gerente de Finanzas', resultados: 'aprobacion de solicitud', documento: 'info.pdf' }
    ]

    const entregaList = ['Long list']

    const onEditEmpresaExterna = (e) => {
        e.preventDefault();
    }

    return (
        <div className="px-3 flex flex-column justify-content-center align-items-center">
            <form className='mt-3 bg-white text-black p-5 border-round mb-5' onSubmit={onEditEmpresaExterna} style={{ width: 750 }}>
                <h4>Informacion de la Empresa Externa</h4>
                <table className="w-full">
                    <colgroup>
                        <col style={{ width: '30%' }} />
                        <col style={{ width: '70%' }} />
                    </colgroup>
                    <tr>
                        <td>Nombre:</td>
                        <td>BukPerú</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Telefono/Contacto:</td>
                        <td>992182873</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Correo Electronico:</td>
                        <td>contacto@bulk.com.pe</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Direccion:</td>
                        <td>Av. Tupac Amaru 210, Rimac</td>
                    </tr>
                    <br />
                    <tr>
                        <td>Entrega:</td>
                        <td>
                            <Dropdown options={entregaList} placeholder="Seleccione una entrega" />
                        </td>
                    </tr>
                </table>

                <h4>Entregas </h4>
                <DataTable value={data} className="mt-5" responsiveLayout="scroll">
                    <Column field="tip_documento" header="Tipo Documento"></Column>
                    <Column field="fec_entrega" header="Fecha de Entrega"></Column>
                    <Column field="participantes" header="Participantes"></Column>
                    <Column field="resultados" header="Resultados"></Column>
                    <Column field="documento" header="Documento"></Column>
                </DataTable>

                <div className='flex gap-4 justify-content-center mt-6 mb-3'>
                    <Button className='p-button-primary p-button-sm' icon="pi pi-save" label="Guardar" />
                </div>
            </form>
        </div>
    )
}
