# Livestream modular service

This module implements the [rdk camera API](https://github.com/rdk/camera-api) in a youtube-stream model.
With this model, you can provide a youtube URL as a configurable attribute to a camera component.

With this model, you can provide a URL to a video hosted on youtube or [other supported websites](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md) as a configurable attribute to a camera component.

## Requirements

The module executable is currently only supported on `linux/arm64`, `linux/amd64`, and `darwin/arm64`. Make sure your machine is running on one of these architectures to avoid exec format issues.

## Build and Run

To use this module, follow these instructions to [add a module from the Viam Registry](https://docs.viam.com/registry/configure/#add-a-modular-resource-from-the-viam-registry) and select the `julie:livestream:youtube-stream` model from the [`livestream` module](https://app.viam.com/module/rdk/julie:camera:youtube-stream).

## Configure your camera

> [!NOTE]  
> Before configuring your camera, you must [create a machine](https://docs.viam.com/manage/fleet/machines/#add-a-new-machine).

Navigate to the **Config** tab of your robot’s page in [the Viam app](https://app.viam.com/).
Click on the **Components** subtab and click **Create component**.
Select the `camera` type, then select the `julie:livestream:youtube-stream` model. 
Enter a name for your camera and click **Create**.

To use this custom Viam Camera component, the following configuration is required:

Generalized Attribute Guide

```json
{
  "video_url": "https://www.youtube.com/some_video"
}
```
Specific Example

```json
{
  "video_url": "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
}
```

### Attributes

The following attributes are available for `julie:livestream:youtube-stream` cameras:

| Name | Type | Inclusion | Description |
| ---- | ---- | --------- | ----------- |
| `video_url` | string | **Required** |  This URL specifies the livestream video that the camera will play. |

### Example Configuration

```json
{
      "name": "my-youtube-stream",
      "namespace": "rdk",
      "type": "camera",
      "model": "julie:livestream:youtube-stream",
      "attributes": {
        "video_url": "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
      }
    }
```

## Troubleshooting

_If the livestream fails to load from a particular website, check if it's also available on YouTube_

_Ex: livestreams from [San Diego Zoo live cameras](https://zoo.sandiegozoo.org/live-cameras) may not load directly, but they are available on [YouTube](https://www.youtube.com/@SanDiegoZoo/streams)._
