// Generated by gencpp from file primeiro_proj/situationResponse.msg
// DO NOT EDIT!


#ifndef PRIMEIRO_PROJ_MESSAGE_SITUATIONRESPONSE_H
#define PRIMEIRO_PROJ_MESSAGE_SITUATIONRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace primeiro_proj
{
template <class ContainerAllocator>
struct situationResponse_
{
  typedef situationResponse_<ContainerAllocator> Type;

  situationResponse_()
    : situation(0)  {
    }
  situationResponse_(const ContainerAllocator& _alloc)
    : situation(0)  {
  (void)_alloc;
    }



   typedef uint8_t _situation_type;
  _situation_type situation;





  typedef boost::shared_ptr< ::primeiro_proj::situationResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::primeiro_proj::situationResponse_<ContainerAllocator> const> ConstPtr;

}; // struct situationResponse_

typedef ::primeiro_proj::situationResponse_<std::allocator<void> > situationResponse;

typedef boost::shared_ptr< ::primeiro_proj::situationResponse > situationResponsePtr;
typedef boost::shared_ptr< ::primeiro_proj::situationResponse const> situationResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::primeiro_proj::situationResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::primeiro_proj::situationResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::primeiro_proj::situationResponse_<ContainerAllocator1> & lhs, const ::primeiro_proj::situationResponse_<ContainerAllocator2> & rhs)
{
  return lhs.situation == rhs.situation;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::primeiro_proj::situationResponse_<ContainerAllocator1> & lhs, const ::primeiro_proj::situationResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace primeiro_proj

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::primeiro_proj::situationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::primeiro_proj::situationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::primeiro_proj::situationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::primeiro_proj::situationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::primeiro_proj::situationResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::primeiro_proj::situationResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::primeiro_proj::situationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f737e5fcbaaa86f9d9437904e7db66b6";
  }

  static const char* value(const ::primeiro_proj::situationResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf737e5fcbaaa86f9ULL;
  static const uint64_t static_value2 = 0xd9437904e7db66b6ULL;
};

template<class ContainerAllocator>
struct DataType< ::primeiro_proj::situationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "primeiro_proj/situationResponse";
  }

  static const char* value(const ::primeiro_proj::situationResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::primeiro_proj::situationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 situation # situation of the tiago robot\n"
"\n"
;
  }

  static const char* value(const ::primeiro_proj::situationResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::primeiro_proj::situationResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.situation);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct situationResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::primeiro_proj::situationResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::primeiro_proj::situationResponse_<ContainerAllocator>& v)
  {
    s << indent << "situation: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.situation);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PRIMEIRO_PROJ_MESSAGE_SITUATIONRESPONSE_H
