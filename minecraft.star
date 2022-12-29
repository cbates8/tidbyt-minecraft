load("render.star", "render")
load("schema.star", "schema")

def main(config):
    message = "{}:{}".format(config.str("ip"), config.str("port"))
    
    msg = render.Text(message)

    return render.Root(
        child = msg,
    )


def get_schema():
    return schema.Schema(
        version = "1",
        fields = [
            schema.Text(
                id = "ip",
                name = "IP Address",
                desc = "Public IP of your server.",
                icon = "server",
                default = "127.0.0.1",
            ),
            schema.Text(
                id = "port",
                name = "Port Number",
                desc = "The port being used by your server",
                icon = "hashtag",
                default = "25565",
            ),            
        ],
    )