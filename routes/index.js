var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn;
/* GET home page. */
router.post('/', function(req, res) {
    var commitMsg = req.body.head_commit.message;
    if (commitMsg === 'update_qual') {
        console.log('allez on update la qual');
        var dl = spawn(process.cwd() + '/bash/hook.sh');
        dl.stdout.on('data', function(data) {
            console.log(data.toString());
        });
        dl.stdout.on('end', function(data) {
            console.log(' downloaded finished ');
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