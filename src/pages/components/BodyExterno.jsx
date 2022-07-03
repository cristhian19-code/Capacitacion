import { EmpresaExterna } from "./EmpresaExterna"
import { JefaturaReclutamiento } from "./JefaturaReclutamiento"

export const BodyExterno = ({ tipoExterno }) => {


    return (
        <div className='py-5'>
            {
                tipoExterno.indexOf('jefatura') !== -1 ? (
                    <JefaturaReclutamiento />
                ) : (
                    <EmpresaExterna />
                )
            }
        </div>
    )
}
