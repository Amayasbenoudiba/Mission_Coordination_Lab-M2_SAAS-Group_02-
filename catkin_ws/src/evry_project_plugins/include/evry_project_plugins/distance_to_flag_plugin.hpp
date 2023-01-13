#ifndef DISTANCE_TO_FLAG_PLUGIN_HPP
#define DISTANCE_TO_FLAG_PLUGIN_HPP

#include "gazebo/gazebo.hh"
#include "gazebo/physics/physics.hh"
#include "gazebo/common/Plugin.hh"
#include <ignition/math.hh>


#include <ros/ros.h>
#include <geometry_msgs/Pose2D.h>
#include <evry_project_plugins/DistanceToFlag.h>

#include <random>


namespace gazebo{
  class DistanceToFlagPlugin: public WorldPlugin{
    public:
      DistanceToFlagPlugin();
      virtual ~DistanceToFlagPlugin();

    protected:
      virtual void Load(physics::WorldPtr world, sdf::ElementPtr sdf);

    private:
      ros::NodeHandle* _nh;
      ros::ServiceServer _dtf_service;

      std::default_random_engine _generator;
      std::normal_distribution<double> _distribution;

      std::vector<geometry_msgs::Pose2D> _flags_poses;

      bool distanceToFlag(evry_project_plugins::DistanceToFlag::Request& req, evry_project_plugins::DistanceToFlag::Response& res);
  };
}

#endif
