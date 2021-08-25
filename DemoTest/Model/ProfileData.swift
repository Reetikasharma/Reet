//
//  ProfileData.swift
//  DemoTest
//
//  Created by Reetika Sharma on 26/08/21.
//

import Foundation

class ProfileData :Decodable {
    var data :[UserQueryData]
}

class UserQueryData : Decodable {
    var id:Int
    var user_id:Int
    var follower_id:Int
    var status:Int
    var first_name: String
    var last_name: String
    var user_name: String
    var email:String
    var phone: String
    var bio: String
    var profile_picture:String
    var dob: String
    var gender:String
    var social_id:Int?
    var social_site:String?
    var country_id: Int
    var state_id:Int
    var device_token_android: String?
    var device_token_ios: String?
    var total_coins:Int
    var received_coins:Int
    var  sent_coins:Int
    var total_own_groups:Int
    var total_member_of_groups:Int
    var total_followers:Int
    var total_followings:Int
    var total_tags:Int
    var total_broadcasts:Int
    var type:Int
    var subscription_date:String?
    var is_notification_active:String
    var is_private:String
    var remember_token:String?
    var block: Int
    var follow:Int
    var followings:FollowingsData
    class FollowingsData: Decodable {
        var id:Int
        var first_name: String
        var last_name: String
        var user_name: String
        var email:String
        var phone: String
        var bio: String
        var profile_picture:String
        var dob: String
        var gender:String
        var social_id:Int?
        var social_site:String?
        var state_id:Int
        var country_id: Int
        var device_token_android: String?
        var device_token_ios: String?
        var total_coins:Int
        var received_coins:Int
        var  sent_coins:Int
        var total_own_groups:Int
        var total_member_of_groups:Int
        var total_followers:Int
        var total_followings:Int
        var total_tags:Int
        var image_path:String
        var total_broadcasts:Int
        var type:Int
        var status:Int
        var subscription_date:String?
        var is_notification_active:String
        var is_private:String
        var  formatted_total_coins:String
        var formatted_received_coins: String
        var formatted_sent_coins:String
        var formatted_total_followers:String
        var formatted_total_followings:String
        var formatted_total_broadcasts:String
        var user_tags:[UserTagsData]
        class UserTagsData:Decodable {
            var id:Int
            var user_id:Int
            var tag_id:Int
            var tag:TagData
            class TagData:Decodable {
                var id:Int
                var name: String
                var icon: String
                var is_active:Int
            }
        }
    }
}
