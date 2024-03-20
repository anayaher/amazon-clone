const express = require('express');
const User = require('../models/user');
const bcyrptjs = require('bcryptjs');

const authRouter = express.Router();





authRouter.post('/api/signup',async (req,res)=>
{
   try
   {
    const {name,email,password}  = req.body;
    const existingUser = await User.findOne({email});
    if(existingUser) 
    {
     return res.status(400).json({msg:"User With Same Email Already Exists"});
    }
   const hashedPassword = await  bcyrptjs.hash(password, 8)
 
    let user =  User({
     email,
     password:hashedPassword,
     name,
    });
    user =await  user.save();
    res.json(user);
   }
   catch(e)
   {
    res.status(500).json({error: e.message});
   }

});
module.exports = authRouter;