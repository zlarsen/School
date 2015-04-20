var mongoose = require('mongoose');  
var teacherSchema = new mongoose.Schema({  
  name: String,
  badge: Number,
  dob: { type: Date, default: Date.now },
  sexy: Boolean
});
mongoose.model('Teacher', teacherSchema);