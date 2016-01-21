var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn;
/* GET home page. */
router.post('/', function(req, res) {
    var commitMsg=req.body.head_commit.message;
    if(commitMsg === 'update_qual'){
        console.log('allez on update la qual');
        spawn(process.cwd()+'bash/hook.sh');
    } 
    res.json({status:'update executed'});
});

module.exports = router;