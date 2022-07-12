import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { startGetConocimiento, startGetTiposCargo } from '../store/actions/items';

export const useComboInput = () => {
    const dispatch = useDispatch();
    const { conocimientos, tipos_cargo } = useSelector(state => state.items);

    const [filterCargos, setFilterCargos] = useState(null)

    const [conocimiento, setConocimiento] = useState(null)
    const [tipoCargo, setTipoCargo] = useState(null)

    useEffect(() => {
        dispatch(startGetConocimiento());
        dispatch(startGetTiposCargo());
    }, [])

    const onSelectConocimiento = (e) => {
        setConocimiento(e.value)
    }

    const onSearchTipoCargo = (e) => {
        const _cargos = tipos_cargo.filter(tipo_cargo => tipo_cargo.nombre_cargo.toLowerCase().includes(e.query.toLowerCase()))
        const _cargos_filtered = _cargos.map(cargo => ({
            label: cargo.nombre_cargo,
            value: cargo.id_cargo
        }))
        setFilterCargos(_cargos_filtered)
    }

    const onChangeTipoCargo = (e) => {
        console.log(e)
    }

    return {
        tipos_cargo,
        onSearchTipoCargo,
        filterCargos,
        onChangeTipoCargo
    }
}
