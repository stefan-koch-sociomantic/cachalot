FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive \
    # Environment variables for program versions
    # (scripts use them to know which version to install)
    VERSION_FPM=1.8.1

LABEL \
    maintainer="Sociomantic Labs GmbH <tsunami@sociomantic.com>" \
    description="Base image for Sociomantic Labs projects" \
    # Labels for program versions
    com.sociomantic.version.fpm=$VERSION_FPM

COPY docker/ /docker-tmp
RUN /docker-tmp/run-scripts base \
		base \
		git \
		fpm \
	&& rm -fr /docker-tmp
