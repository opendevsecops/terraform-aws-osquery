const uuid = require('uuid/v4')

const config = require('./config.json')

exports.enroll = async (params) => {
    console.log(params)

    return {
        node_key: uuid()
    }
}

exports.killswitch = async (params) => {
    console.log(params)

    throw new Error('Not implemented')
}

exports.config = async (params) => {
    console.log(params)

    return config
}

exports.log = async (params) => {
    console.log(params)
}

exports.handler = async (event) => {
    const { op='', params={} } = event

    switch (op) {
        case 'enroll': return exports.enroll(params)
        case 'killswitch': return exports.killswitch(params)
        case 'config': return exports.config(params)
        case 'log': return exports.log(params)

        default: throw new Error(`Unrecognized op ${op}`)
    }
}
