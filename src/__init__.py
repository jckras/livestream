"""
This file registers the model with the Python SDK.
"""

from viam.components.camera import Camera
from viam.resource.registry import Registry, ResourceCreatorRegistration

from .youtubeStream import youtubeStream

Registry.register_resource_creator(Camera.SUBTYPE, youtubeStream.MODEL, ResourceCreatorRegistration(youtubeStream.new, youtubeStream.validate))
