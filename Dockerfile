FROM ghcr.io/makinarocks/mrx-link:0.10.4-python3.9

USER root
COPY sample-notebooks/*.ipynb "${HOME}/workspace"
RUN chown -R "${NB_UID}:${NB_GID}" "${HOME}/workspace" && \
    fix-permissions "${HOME}/workspace"

USER ${NB_USER}

RUN "/opt/python/bin/python3" -m pip install --upgrade "notebook==6.5.2" && \
    rm -fr "$(/opt/python/bin/python3 -m pip cache dir)"

WORKDIR "${HOME}/workspace"

EXPOSE 8888
