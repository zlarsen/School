var express = require('express'),
    router = express.Router(),
    mongoose = require('mongoose'), //mongo connection
    bodyParser = require('body-parser'), //parses information from POST
    methodOverride = require('method-override'); //used to manipulate POST

router.use(bodyParser.urlencoded({ extended: true }))
router.use(methodOverride(function(req, res){
      if (req.body && typeof req.body === 'object' && '_method' in req.body) {
        // look in urlencoded POST bodies and delete it
        var method = req.body._method
        delete req.body._method
        return method
      }
}))

//build the REST operations at the base for teachers
//this will be accessible from http://127.0.0.1:3000/teachers if the default route for / is left unchanged
router.route('/')
    //GET all teachers
    .get(function(req, res, next) {
        //retrieve all teachers from Monogo
        mongoose.model('Teacher').find({}, function (err, teachers) {
              if (err) {
                  return console.error(err);
              } else {
                  //respond to both HTML and JSON. JSON responses require 'Accept: application/json;' in the Request Header
                  res.format({
                      //HTML response will render the index.jade file in the views/teachers folder. We are also setting "teachers" to be an accessible variable in our jade view
                    html: function(){
                        res.render('teachers/index', {
                              title: 'All my teachers',
                              "teachers" : teachers
                          });
                    },
                    //JSON response will show all teachers in JSON format
                    json: function(){
                        res.json(infophotos);
                    }
                });
              }     
        });
    })
    //POST a new teacher
    .post(function(req, res) {
        // Get values from POST request. These can be done through forms or REST calls. These rely on the "name" attributes for forms
        var name = req.body.name;
        var badge = req.body.badge;
        var dob = req.body.dob;
        var company = req.body.company;
        var sexy = req.body.sexy;
        //call the create function for our database
        mongoose.model('Teacher').create({
            name : name,
            badge : badge,
            dob : dob,
            sexy : sexy
        }, function (err, teacher) {
              if (err) {
                  res.send("There was a problem adding the information to the database.");
              } else {
                  //teacher has been created
                  console.log('POST creating new teacher: ' + teacher);
                  res.format({
                      //HTML response will set the location and redirect back to the home page. You could also create a 'success' page if that's your thing
                    html: function(){
                        // If it worked, set the header so the address bar doesn't still say /adduser
                        res.location("teachers");
                        // And forward to success page
                        res.redirect("/teachers");
                    },
                    //JSON response will show the newly created teacher
                    json: function(){
                        res.json(teacher);
                    }
                });
              }
        })
    });

/* GET New Teacher page. */
router.get('/new', function(req, res) {
    res.render('teachers/new', { title: 'Add New Teacher' });
});

// route middleware to validate :id
router.param('id', function(req, res, next, id) {
    //console.log('validating ' + id + ' exists');
    //find the ID in the Database
    mongoose.model('Teacher').findById(id, function (err, teacher) {
        //if it isn't found, we are going to repond with 404
        if (err) {
            console.log(id + ' was not found');
            res.status(404)
            var err = new Error('Not Found');
            err.status = 404;
            res.format({
                html: function(){
                    next(err);
                 },
                json: function(){
                       res.json({message : err.status  + ' ' + err});
                 }
            });
        //if it is found we continue on
        } else {
            //uncomment this next line if you want to see every JSON document response for every GET/PUT/DELETE call
            //console.log(teacher);
            // once validation is done save the new item in the req
            req.id = id;
            // go to the next thing
            next(); 
        } 
    });
});

router.route('/:id')
  .get(function(req, res) {
    mongoose.model('Teacher').findById(req.id, function (err, teacher) {
      if (err) {
        console.log('GET Error: There was a problem retrieving: ' + err);
      } else {
        console.log('GET Retrieving ID: ' + teacher._id);
        var teacherdob = teacher.dob.toISOString();
        teacherdob = teacherdob.substring(0, teacherdob.indexOf('T'))
        res.format({
          html: function(){
              res.render('teachers/show', {
                "teacherdob" : teacherdob,
                "teacher" : teacher
              });
          },
          json: function(){
              res.json(teacher);
          }
        });
      }
    });
  });

//GET the individual teacher by Mongo ID
router.get('/:id/edit', function(req, res) {
    //search for the teacher within Mongo
    mongoose.model('Teacher').findById(req.id, function (err, teacher) {
        if (err) {
            console.log('GET Error: There was a problem retrieving: ' + err);
        } else {
            //Return the teacher
            console.log('GET Retrieving ID: ' + teacher._id);
            //format the date properly for the value to show correctly in our edit form
          var teacherdob = teacher.dob.toISOString();
          teacherdob = teacherdob.substring(0, teacherdob.indexOf('T'))
            res.format({
                //HTML response will render the 'edit.jade' template
                html: function(){
                       res.render('teachers/edit', {
                          title: 'teacher' + teacher._id,
                        "teacherdob" : teacherdob,
                          "teacher" : teacher
                      });
                 },
                 //JSON response will return the JSON output
                json: function(){
                       res.json(teacher);
                 }
            });
        }
    });
});

//PUT to update a teacher by ID
router.put('/:id/edit', function(req, res) {
    // Get our REST or form values. These rely on the "name" attributes
    var name = req.body.name;
    var badge = req.body.badge;
    var dob = req.body.dob;
    var company = req.body.company;
    var sexy = req.body.sexy;

   //find the document by ID
        mongoose.model('Teacher').findById(req.id, function (err, teacher) {
            //update it
            teacher.update({
                name : name,
                badge : badge,
                dob : dob,
                sexy : sexy
            }, function (err, teacherID) {
              if (err) {
                  res.send("There was a problem updating the information to the database: " + err);
              } 
              else {
                      //HTML responds by going back to the page or you can be fancy and create a new view that shows a success page.
                      res.format({
                          html: function(){
                               res.redirect("/teachers/" + teacher._id);
                         },
                         //JSON responds showing the updated values
                        json: function(){
                               res.json(teacher);
                         }
                      });
               }
            })
        });
});

//DELETE a teacher by ID
router.delete('/:id/edit', function (req, res){
    //find teacher by ID
    mongoose.model('Teacher').findById(req.id, function (err, teacher) {
        if (err) {
            return console.error(err);
        } else {
            //remove it from Mongo
            teacher.remove(function (err, teacher) {
                if (err) {
                    return console.error(err);
                } else {
                    //Returning success messages saying it was deleted
                    console.log('DELETE removing ID: ' + teacher._id);
                    res.format({
                        //HTML returns us back to the main page, or you can create a success page
                          html: function(){
                               res.redirect("/teachers");
                         },
                         //JSON returns the item with the message that is has been deleted
                        json: function(){
                               res.json({message : 'deleted',
                                   item : teacher
                               });
                         }
                      });
                }
            });
        }
    });
});

module.exports = router;