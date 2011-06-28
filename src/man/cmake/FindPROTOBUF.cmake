
##
# Includes
##

INCLUDE ( ${CMAKE_MODULE_PATH}/base_definitions.cmake )

##
# Clear variables/caches
##

SET(PROTOBUF_INCLUDE_DIR "PROTOBUF_INCLUDE_DIR-NOTFOUND" CACHE FILEPATH "Cleared." FORCE)
SET(PROTOBUF_LIBRARIES "PROTOBUF_LIBRARIES-NOTFOUND" CACHE FILEPATH "Cleared." FORCE)

##
# Find package requirements
##

  IF ( OE_CROSS_BUILD )
    SET( PROTOBUF_INCLUDE_DIR /usr/include/ )
    SET( PROTOBUF_LIBRARIES /usr/lib/libprotobuf.so )
  ELSE ( OE_CROSS_BUILD )
    IF( WIN32 )
#      SET( PROTOBUF_ROOT $ENV{PROTOBUF_ROOT})
#      SET( PROTOBUF_INCLUDE_DIR ${PROTOBUF_ROOT}/include/ )
#      SET( PROTOBUF_LIBRARIES ${PROTOBUF_ROOT}/lib/PROTOBUFGCE2.dll )
#      SET( PROTOBUF_DEFINITIONS "" )
    ELSE ( WIN32 )
      SET( PROTOBUF_INCLUDE_DIR /usr/include/ )
      IF ( APPLE )
        SET( PROTOBUF_LIBRARIES /usr/lib/libPROTOBUF.dylib )
      ELSE ( APPLE )
        SET( PROTOBUF_LIBRARIES /usr/lib/libprotobuf.so )
      ENDIF( APPLE )
    ENDIF( WIN32 )
  ENDIF ( OE_CROSS_BUILD )




IF( PROTOBUF_INCLUDE_DIR AND PROTOBUF_LIBRARIES )
  SET( PROTOBUF_FOUND TRUE )
ENDIF( PROTOBUF_INCLUDE_DIR AND PROTOBUF_LIBRARIES )

IF( NOT PROTOBUF_FOUND AND PROTOBUF_FIND_REQUIRED )
  IF( NOT PROTOBUF_INCLUDE_DIR )
        MESSAGE( STATUS "Required include not found" )
    MESSAGE( FATAL_ERROR "Could not find PROTOBUF include!" )
  ENDIF( NOT PROTOBUF_INCLUDE_DIR )
  IF( NOT PROTOBUF_LIBRARIES )
    MESSAGE( STATUS "Required libraries not found" )
    MESSAGE( FATAL_ERROR "Could not find PROTOBUF libraries!" )
  ENDIF( NOT PROTOBUF_LIBRARIES )
ENDIF( NOT PROTOBUF_FOUND AND PROTOBUF_FIND_REQUIRED )


# Finally, display informations if not in quiet mode
IF( NOT PROTOBUF_FIND_QUIETLY )
  MESSAGE( STATUS "PROTOBUF found " )
  MESSAGE( STATUS "  includes   : ${PROTOBUF_INCLUDE_DIR}" )
  MESSAGE( STATUS "  libraries  : ${PROTOBUF_LIBRARIES}" )
ENDIF( NOT PROTOBUF_FIND_QUIETLY )



MARK_AS_ADVANCED(
  PROTOBUF_DEFINITIONS
  PROTOBUF_INCLUDE_DIR
  PROTOBUF_LIBRARIES
)