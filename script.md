```bash
# Generate App
coldbox create app name="contacts"  skeleton=rest-hmvc

# Install some dependencies for dev
install route-visualizer,mockdatacfc --savedev

# Start Server
server start

# Show api entrypoints: http://127.0.0.1:56326/api/v1/echo

# Show Tests: http://127.0.0.1:56326/tests/runner.cfm
# Add to CommandBox
package set testbox.runner="http://127.0.0.1:56326/tests/runner.cfm"
testbox run

# Create Resources
coldbox create resource resource="contacts" singularName="contact" module="v1" modulesDirectory="modules_app/api/modules_app"

# Open config/Router.cfc and verify in route visualizer
resources( "contacts" );

# Reinit app
coldbox reinit

# Show routes: http://127.0.0.1:64554/route-visualizer

# Open ContactService and work on the service list() and get() methods
# Open the contacts handler and get it working

server stop
# Run it on Docker
docker run -p 8080:8080 -p 8443:8443 -v "`pwd`:/app" ortussolutions/commandbox:lucee5