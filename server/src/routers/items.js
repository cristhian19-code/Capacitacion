const router = require('express').Router();
const { getTipoCargo, getConocimiento } = require('../controllers/items.controller');


router.get('/tipo_cargo', getTipoCargo);

router.get('/conocimiento', getConocimiento);

module.exports = router;