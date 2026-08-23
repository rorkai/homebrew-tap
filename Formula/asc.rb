# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.9.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.0/asc_4.9.0_macOS_arm64'
      sha256 'df3efaec856f16a0c6d6093c3266e44ba664fcfdcfe2dae4791a9cd3c03657e3'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.9.0/asc_4.9.0_macOS_amd64'
      sha256 'd14bb7adc5f04ed1c5263be0152648f168e0711da135f269b580a50e3a34a6be'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.9.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.9.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
