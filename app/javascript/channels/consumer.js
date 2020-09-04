// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.

import { createConsumer } from "@rails/actioncable";
import Glide, { Controls, Breakpoints } from '@glidejs/glide/dist/glide.modular.esm'

new Glide('.glide').mount({ Controls, Breakpoints })

export default createConsumer()
