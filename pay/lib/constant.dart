// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// class Constant {
//   static const base = "https://courtn.digitaezonline.com";
//   static const imagepath = "https://courtn.digitaezonline.com/storage/";
//   //Auth : [Post]
//   //Login:
//   static const tokenURL = base + "/api/login";
//   //Logout:
//   static const logout = base + "/api/logout";
//   //logoutAll Devices:
//   static const logoutall = base + "/api/logout-devices";
// // Register :
//   static const signup = base + "/api/signup";
//   //Request_Otp:
//   static const requestotp = base + "/api/request_otp";
//   //Verify_Otp:
//   static const verifyotp = base + "/api/verify_otp";
//   //Add User_Details :
//   static final adduserdetails = base + "/api/user_details/";

//   // Profile :
//   static final editprofile = base + "/edit-user";

// //Free User: [Get]
//   static const user = base + "/api/user";
// //Matching Tools : [Get]
//   static const freelistusers = base + "/api/users";
//   static const searchmatchingfilter = base +
//       "/api/search?distance=0&interest[]=tennis&longitude=34.4&latitude=34.4";
// //

// //Paid User:
// //Matching Tools : [Get]
//   static const paidlistusers = base + "/api/users";
//   static const matchingtoolsforpaiduser =
//       base + "/api/search?interests[]=tennis";
// //Invisible Tools : [Post]'
//   static const toggleinvisibility = base + "/api/invisible-mode";
// //Signup Payment : [Post]
//   static const getstriptoken = base + "/api/signup-pay-token";
//   static const donepayment = base + "/api/signup-pay";
//   //
//   // Courtn : [Get]

//   static const GetAllcourtsowener = base + "/api/court";
//   static const Getsinglecourtowner = base + "/api/court/3";
//   static const searchcourtn =
//       base + "/api/court-search?longitude=28.626137&latitude=23.4&distance=1";

// //Friends :
// //[Post]
//   static const request = base + "/api/friend-request";
//   static const requestaccept = base + "/api/friend-request/3?request=accept";
//   static const requestreject = base + "/api/friend-request/3?request=reject";
//   //[Get]
//   static const listpendingto = base + "/api/friend-request/pending-to";
//   static const listpendingform = base + "/api/friend-request/pending-from";
//   static const listacceptto = base + "/api/friend-request/accepted-to";
//   static const listacceptfrom = base + "/api/friend-request/accepted-from";
//   static const listrejectto = base + "/api/friend-request/rejected-from";
//   static const listrejectform = base + "/api/friend-request/rejected-to";
//   //[Post]
//   static const blockfriend = base + "/api/friend-request/block";
//   static const unblockfriend = base + "/api/friend-request/un-block";
//   //[Get]
//   static const allblockfriend = base + "/api/friend-request/block";
//   static const allfriend = base + "/api/friend-request/friends";

//   //Booking : [Post]
//   static const create = base + "/api/booking";
//   static const bookingcourtstrippaymentT = base + "/api/court-pay-token";
//   // static const donepaymentbooking = base + "/api/court-pay";
//   // Chat :
//   //[Get]
//   static const getallmessages = base + "/api/messages?receiver_id=2";
//   //[Post]
//   static const sendmessages = base + "/api/messages";
//   //

//   //Deals and Discount :
// //[Get]
//   static const all = base + "/api/deals-n-discount";
//   //[Get]
//   static const single = base + "/api/deals-n-discount/1";
//   //[Delete]
//   // static const delete = base + "/api/deals-n-discounts/1";
//   // //[Post]
//   // static const update = base + "/api/deals-n-discount/1";
//   // //[Post]
//   // static const store = base + "/api/deals-n-discount";

//   ///

//   //Add Live Location :
//   //   the is the main cousre of things are the of
//   //[Post]
//   static const livelocation = base + "/api/live-location";
// /////////////////
//   static const imageUrl = base + "/storage/";
//   //  deals/NmW2D5iRpFNSfTXKr8E5jvgQTxAsq3dEr3jtmcwd.jpg";
// //https://courtn.digitaezonline.com/storage/deals/FLJ4agp7acYsO2WL7DBrfmnQyhotJ3gMElvWhJz1.jpg
//   // Deals And Discount Images :
//   static const dealimageUrl1 =
//       base + "/storage/deals/FLJ4agp7acYsO2WL7DBrfmnQyhotJ3gMElvWhJz1.jpg";
//   static const dealimageUrl2 =
//       base + "/storage/deals/NmW2D5iRpFNSfTXKr8E5jvgQTxAsq3dEr3jtmcwd.jpg";
//   static const dealimageUrl3 =
//       base + "/storage/deals/fN0pblIk3HMFQNfVhxm0RoSsDRBneuDGzSa22RlS.jpg";
//   static const dealimageUrl4 =
//       base + "/storage/deals/9I35wC8yeg3A662OAYL7m31yEeKqd0K5jdHcggQ6.jpg";
//   static const dealimageUrl5 =
//       base + "/storage/deals/iT07zO0DRDsEsyTyLsxyazlj7tiWRHYewa4vdOmS.jpg";
//   static const dealimageUrl6 =
//       base + "/storage/deals/xIj5T5lc4HZ3ULJCUlCQkvzPZ0HmW7FAVBCDcTkJ.png";

// // DropDown Cities :
//   static const cities = base + "/api/city";
//   // INTEREST :
//   // Hobbies :
//   static const hobbies = base + "/api/interest?name=hobbies";

//   //Favorite Sport :>
//   static const sport = base + "/api/interest";
//   //Skill :
//   static const skills = base + "/api/skill";

//   // ----- Find Court Images: -----
//   static const court1 =
//       "$base$imagepath/court/rPw1C64GeyjhcJ4laN1zlVvvGiy54IviD4Wg2DwI.jpg";
//   static const court2 =
//       "$base$imagepath/court/6xYydgw5BdFwIDaJYZYuiOPtLsXODoB6PBmAuBVY.jpg";

//   static const court3 =
//       "$base$imagepath/court/KzwDOJfPIZR27g33vZR3y9AmYfcigYFPLhRTUMUH.jpg";
//   static const court4 =
//       "$base$imagepath/court/UzLjpB6I8Ekc59prORcXCiDGM3pF6XtkMMED0z0E.jpg";

//   static const court5 =
//       "$base$imagepath/court/teQBE2MfCystFTZ07Y8PQzEtZhxd5GfGydaxILcL.jpg";

//   static const court6 =
//       "$base$imagepath/court/Ct5JjnL1uHe4iWrzy3ST43KKaObVCZ7ufkYRxPbW.jpg";
//   static const court7 =
//       "$base$imagepath/court/6Eg6HwoPZVk81QkCiu5KA8pEY0oIy02Oq3jaokMG.jpg";
//   static const court8 =
//       "$base$imagepath/court/DN9loYQSvadGNqMTu4KqubBJYuAwZcO1HzSuoyFn.jpg";

//   static const court9 =
//       "$base$imagepath/court/6A7oFdForubBusHdq7RfCz7zYTgAm8prERpSV2rR.jpg";
//   static const court10 =
//       "$base$imagepath/court/8JndTZYdkEfEIDpUMDTBEjl5niaNauyUkkna0vcX.jpg";
//   static const court11 =
//       "$base$imagepath/court/TiLdNjpNoHBbOOUnriJOUEzA5eGjyEstoginiv2I.jpg";
//   static const court12 =
//       "$base$imagepath/court/hjXbNhHXLJW42RcYkcyh7oKljkiWRbbCdAtHVIYL.jpg";
//   static const court13 =
//       "$base$imagepath/court/Djijw5Mg80c0B1D36kJMwWJP4qeP6zgeDY8naf2D.jpg";
//   static const court14 =
//       "$base$imagepath/court/t6q0WRWONrtIch0QHr58DJxyyhLDO6EGboTxqLKI.jpg";
//   static const court15 =
//       "$base$imagepath/court/ilQhBRwcqLtmsdptBOHq90RmvMpKLx7EEN7Yx5vy.jpg";
//   static const court16 =
//       "$base$imagepath/court/xoV75W1WhWtDzNokZqmOF81doSNjZSQAcLu4Un87.jpg";
//   static const court17 =
//       "$base$imagepath/court/Utzd69btbW3kMWuey76tai3u6QqTqKvVCE6F0U1j.jpg";
//   static const court18 =
//       "$base$imagepath/court/6EpuuARFj4iMy2I0OLgeoWTYh1t9nymikEmrLxFr.jpg";
//   static const court19 =
//       "$base$imagepath/court/8UmmPAcz6bj1aGZPfaNfsoUNpYPEDPsoS3TzMoUd.jpg";
//   static const court20 =
//       "$base$imagepath/court/kfM7uIOM6r3bG0ZJ3HqC4YBuNd0jvCBTnsnx9t70.jpg";
// }
