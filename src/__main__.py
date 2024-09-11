import asyncio
from viam.module.module import Module
from viam.components.camera import Camera
from .youtubeStream import youtubeStream

async def main():
    """This function creates and starts a new module, after adding all desired resources.
    Resources must be pre-registered. For an example, see the `__init__.py` file.
    """
    module = Module.from_args()
    print("I made it past the first line")
    # Registry.register_resource_creator(Camera.SUBTYPE, youtubeStream.MODEL, ResourceCreatorRegistration(youtubeStream.new, youtubeStream.validate))
    print("past registration")
    module.add_model_from_registry(Camera.SUBTYPE, youtubeStream.MODEL)
    await module.start()

if __name__ == "__main__":
    asyncio.run(main())
