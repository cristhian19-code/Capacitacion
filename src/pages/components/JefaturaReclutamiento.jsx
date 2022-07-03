import { Column } from 'primereact/column'
import { DataTable } from 'primereact/datatable'
import { InputText } from 'primereact/inputtext'

export const JefaturaReclutamiento = () => {
    const data = [
        { nombre: 'PortalEmpleoPeru', url: 'https://www.empleadosperu.gob.pe', celular: '918283778', fec_cierre: '12/20/2022' },
        { nombre: 'Bumeran', url: 'https://www.bumeran.com.pe', celular: '912736973', fec_cierre: '23/01/2021' },
        { nombre: 'Linkedin', url: 'https://pe.linkedin.com.pe', celular: '987876678', fec_cierre: '05/08/2022' },
    ]

    return (
        <div>
            <h4>Plataformas de Publicacion</h4>
            <DataTable value={data} className="mt-5" responsiveLayout="scroll">
                <Column field="nombre" header="Nombre"></Column>
                <Column field="url" header="Direccion URL"></Column>
                <Column field="celular" header="Telefono/Celular"></Column>
                <Column field="fec_cierre" header="Fecha Cierre"></Column>
            </DataTable>

            <h4 className='mt-6'>Informacion de la Publicacion</h4>
            <table>
                <colgroup>
                    <col style={{ width: '30%' }} />
                    <col style={{ width: '70%' }} />
                </colgroup>
                <br />
                <tr>
                    <td>
                        <label htmlFor="nom_cargo" className='mr-2'>Nombre del Cargo</label>
                    </td>
                    <td>
                        <InputText id='nom_cargo' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <label htmlFor="des_trabajo" className='mr-2'>Descripcion del Trabajo</label>
                    </td>
                    <td>
                        <InputText id='des_trabajo' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <label htmlFor="per_cargo" className='mr-2'>Perfil del Cargo</label>
                    </td>
                    <td>
                        <InputText id='per_cargo' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <label htmlFor="requisitos" className='mr-2'>Requisitos</label>
                    </td>
                    <td>
                        <InputText id='requisitos' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
                <br />
                <tr>
                    <td>
                        <label htmlFor="ubicacion" className='mr-2'>Ubicacion</label>
                    </td>
                    <td>
                        <InputText id='ubicacion' className='p-inputtext-sm w-full' />
                    </td>
                </tr>
                <br />
            </table>
        </div>
    )
}
