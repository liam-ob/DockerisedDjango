import pytest
from example_docker.asgi import application
from channels.testing import WebsocketCommunicator


@pytest.fixture
def unauthenticated_websocket_communicator() -> WebsocketCommunicator:
    """
    PyTest fixture to create a websocket communicator
    """
    communicator = WebsocketCommunicator(application, f"/ws/chat/1/")
    return communicator


@pytest.mark.asyncio
class TestConsumerAsyncTests:
    @pytest.mark.django_db
    async def test_unauthenticated_cant_connect_to_websocket(self, unauthenticated_websocket_communicator: WebsocketCommunicator):
        connected, subprotocol = await unauthenticated_websocket_communicator.connect()
        assert subprotocol == 3000  # subprotocol 3000 is Unauthorised
        assert connected is False