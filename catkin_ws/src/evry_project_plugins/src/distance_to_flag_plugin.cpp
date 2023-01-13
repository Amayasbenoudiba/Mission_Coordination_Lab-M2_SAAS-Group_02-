#include <evry_project_plugins/distance_to_flag_plugin.hpp>

namespace gazebo{
  DistanceToFlagPlugin::DistanceToFlagPlugin(): _distribution(0, 0.05){
  }

  DistanceToFlagPlugin::~DistanceToFlagPlugin(){
    _flags_poses.clear();
    _nh->shutdown();
    delete _nh;
  }

  void DistanceToFlagPlugin::Load(physics::WorldPtr world, sdf::ElementPtr sdf){
    int nbFlags = sdf->GetElement("nbFlags")->Get<int>(); //get the number of flags in the environment

    //get the flags poses and store it in the vector _flags_poses
    for(int i = 1; i < nbFlags+1; i++){
      ignition::math::Pose3d model_pose = world->ModelByName("flag_" + std::to_string(i))->WorldPose(); //pose of flag with id i 
      geometry_msgs::Pose2D flag_pose;
      flag_pose.x = model_pose.Pos().X();
      flag_pose.y = model_pose.Pos().Y();
      _flags_poses.push_back(flag_pose);
    }

    _nh = new ros::NodeHandle();
    _dtf_service = _nh->advertiseService("distanceToFlag", &DistanceToFlagPlugin::distanceToFlag, this);  //create the service "distanceToFlag"
    _nh->setParam("nb_flags", nbFlags);
  }

  bool DistanceToFlagPlugin::distanceToFlag(evry_project_plugins::DistanceToFlag::Request& req, evry_project_plugins::DistanceToFlag::Response& res){
    float dx = _flags_poses[req.id_flag - 1].x - req.agent_pose.x;  //difference of coordinates between the robot and the specified flag along the x axis
    float dy = _flags_poses[req.id_flag - 1].y - req.agent_pose.y;  //difference of coordinates between the robot and the specified flag along the y axis
    res.distance = std::sqrt(dx*dx + dy*dy);  
    return true;
  }

  GZ_REGISTER_WORLD_PLUGIN(DistanceToFlagPlugin)
}
