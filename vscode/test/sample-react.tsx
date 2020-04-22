import * as React from 'react'

type SomeProps = {
    a: number
}

interface A <P = {}> {
    (props: P, context?: any): React.ReactElement;
}

interface AA <P = {}> {
    (props: P, context?: any): React.ReactElement;
    propTypes?: any;
    contextTypes?: any;
    defaultProps?: Partial<P>;
    displayName?: string;
}

const Layout1: A<SomeProps> = (props: SomeProps) => {
    return <div>{props}</div>
}

const Layout2: AA<SomeProps> = (props: SomeProps) => {
    return <div>{props}</div>
}

console.log(Layout1, Layout2)

export { Layout1, Layout2 };
