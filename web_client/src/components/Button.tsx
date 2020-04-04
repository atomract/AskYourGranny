import React from 'react';
import styled from 'styled-components';

export interface ButtonProps
  extends Omit<
    React.DetailedHTMLProps<React.ButtonHTMLAttributes<HTMLButtonElement>, HTMLButtonElement>,
    'ref'
  > {}

const StyledButton = styled.button`
  border: 3px solid #4e51ff;
  height: 46px;
  color: #6366ff;
  font-size: 16px;
  line-height: 19px;
  text-align: center;
`;

const Button: React.SFC<ButtonProps> = ({ children, ...restProps }) => {
  return <StyledButton {...restProps}>{children}</StyledButton>;
};

export default Button;
