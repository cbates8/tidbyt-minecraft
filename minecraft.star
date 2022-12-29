load("render.star", "render")
load("schema.star", "schema")

def main(config):
    
    if not validate_ip(config.str("ip")):
        message = "Invalid IP Address"
    elif not validate_port(config.str("port")):
        message = "Invalid Port Number"
    else:
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


def validate_ip(address):
    a = address.split('.')
    if len(a) != 4:
        return False
    for x in a:
        if not x.isdigit():
            return False
        i = int(x)
        if i < 0 or i > 255:
            return False
    return True


def validate_port(port):
    return port.isdigit() and int(port) < 65535
