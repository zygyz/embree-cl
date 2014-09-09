
SET (__XEON__ 1)
ADD_SUBDIRECTORY(image)
ADD_SUBDIRECTORY(lexers)
ADD_SUBDIRECTORY(transport)
ADD_SUBDIRECTORY(tutorial)

IF (XEON_PHI_ISA)
  SET (__XEON__ 0)
  ADD_SUBDIRECTORY(tutorial tutorial_xeonphi)
  ADD_SUBDIRECTORY(transport_coi/host)
  ADD_SUBDIRECTORY(transport_coi/device)
ENDIF()
