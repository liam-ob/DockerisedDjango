from time import sleep
from channels
from celery import shared_task


@shared_task
def start_new_hit_job(target_name):
    sleep(10)
    print(f"target sorted {target_name}")


def send_chat_message(message):
    async_to_sync(get_channel_layer().group_send)(
        '1',
        {'message': 'message sent?'}
    )
