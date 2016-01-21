var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn;
var config = require(process.cwd()+'/config/config');
/* GET home page. */
router.post('/', function(req, res) {
    var commitMsg = req.body.head_commit.message;
    var version = req.body.head_commit.id;
    var name = req.body.repository.name;
    var fileName = name+'_'+version+'.zip';
    if (commitMsg === 'update_qual') {
        console.log('allez on update la qual');
        var dl = spawn(process.cwd() + '/bash/hook.sh',[fileName,config.destinationFolder,name]);
 
        dl.stdout.on('end', function(data) {
            console.log('downloaded finished ');
            console.log(name);
            console.log(fileName);
            console.log(version); 
        });
        // when the spawn child process exits, check if there were any errors and close the writeable stream
        dl.on('exit', function(code) {
            if (code != 0) {
                console.log('Failed: ' + code);
            }
        });
    }
    res.json({
        status: 'update executed'
    });
});

module.exports = router;