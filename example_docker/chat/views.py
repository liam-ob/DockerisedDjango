from django.shortcuts import render
import os


def index(request):
    return render(request, "chat/index.html")


def room(request, room_name):
    return render(request, "chat/room.html", {"room_name": room_name})


def retrieve_files(request):
    return render(request, "chat/files.html", {'files': os.walk('exampleProjects')})
